# Initialize the manager
docker swarm init \
--advertise-addr [PRIVATE_IP]


# Add the worker to the cluster:
docker swarm join --token [TOKEN] \
[PRIVATE_IP]:2377

# List the nodes in the swarm:
docker node ls
