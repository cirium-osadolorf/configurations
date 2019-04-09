variable "container_name" {
  description = "Name of container"
}
variable "image" {
  description = "image for container"
}
variable "int_port" {
  description = "internal port for container"
}
variable "ext_port" {
  description = "external port for container"
}

resource "docker_container" "container_id" {
  name  = "${var.container_name}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "${var.int_port}"
    external = "${var.ext_port}"
  }
}