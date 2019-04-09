
variable "env" {
  description ="env : dev or prod"
}

variable "image" {
  description = "image for container"
  type ="map"
  default = {
    dev = "ghost:latest"
    prod = "ghost:alphine"
  }
}
variable "container_name" {
  description = "Name of container"
  default = {
    dev = "dev_blog"
    prod = "prod_blog"
  }
}
variable "int_port" {
  description = "internal port for container"
  default = {
    dev = "2368"
    prod = "2368"
  }
}
variable "ext_port" {
  description = "external port for container"
    default = {
    dev = "80"
    prod = "8081"
  }
}
