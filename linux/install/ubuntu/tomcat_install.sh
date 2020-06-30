# Install java
dnf install java-11-openjdk-devel

#Then we go to a webpage to get the latest version of Tomcat 9. We copy the link to the clipboard:
https://tomcat.apache.org/download-90.cgi
# We will paste that later when we use wget to obtain the Tomcat install files.

# Before we can get them, we need to ensure we have wget installed. We might as well also install some other software that will get used later. (Note: we use yum install here but could also use dnf install):
wget http://mirror.cogentco.com/pub/apache/tomcat/tomcat-9/v9.0.31/bin/apache-tomcat-9.0.31.tar.gz

# Now we go to the folder we want to put Tomcat into:
cd /usr/local

# Extract the downloaded file to the current location. Note: Your filename may be slightly different than what I have here. That's ok:
tar -xvf /root/apache-tomcat-9.0.31.tar.gz

# Now we use the mv command to change the folder name. Note: Your filename may be slightly different than what I have here. That's ok:
mv apache-tomcat-9.0.31 tomcat9

# Now we add the tomcat user as a system account. This means we don't need to do anything special for SELinux, as the system account will allow things to just work as we require. If you don't use a system account, you may need to manually fix things up for use with SELinux:
useradd -r tomcat

# Now we need to change the permissions of the tomcat folder so the tomcat user can use it:
chown -R tomcat:tomcat /usr/local/tomcat9

# Now we need to create the tomcat service. We use Vim to edit the file, but feel free to use the editor of your own choice:
vim /etc/systemd/system/tomcat.service

# Add these contents to the file:
'''
[Unit]
Description=Apache Tomcat
After=syslog.target network.target

[Service]
Type=forking
User=tomcat
Group=tomcat

Environment=CATALINA_PID=/usr/local/tomcat9/temp/tomcat.pid
Environment=CATALINA_HOME=/usr/local/tomcat9
Environment=CATALINA_BASE=/usr/local/tomcat9

ExecStart=/usr/local/tomcat9/bin/catalina.sh start
ExecStop=/usr/local/tomcat9/bin/catalina.sh stop

RestartSec=12
Restart=always
[Install]
WantedBy=multi-user.target
'''
# Now we get the system to recognize a new service is available:
systemctl daemon-reload

# Now let's start the service, then enable it to autostart and check its status:
systemctl start tomcat.service
systemctl enable tomcat.service
systemctl status tomcat.service
Check that Tomcat works by going to your server's web page on the port 8080:

http://YOURSERVERIP:8080

Let's add a user for the web console:

cd /usr/local/tomcat9/
vim conf/tomcat-users.xml
Go to the bottom of the file, and put the following just before the <\/tomcat-users> end block. Don't forget to change the YOURPASSWORDHERE to be your own password:

<role rolename="admin-gui,manager-gui"/> 
<user username="admin" password="YOURPASSWORDHERE" roles="admin-gui,manager-gui"/>
Now you need to allow access to the management web pages from the internet. If you know what you're doing, you could just allow access from your own IP address, but that is not covered in these written instructions:

vim webapps/manager/META-INF/context.xml
Change the following line:

allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
It should read:

allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1 |.*" />
Now restart Tomcat:

systemctl restart tomcat
Now go to your Tomcat web console and use the user you created to log in.

You now have a working Tomcat installation.

