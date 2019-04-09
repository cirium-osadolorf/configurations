
variable "env" {
  description = "env : dev or prod"
}

variable "image" {
  description = "image for container"
  type ="map"
}
variable "container_name" {
  description = "Name of container"

}
variable "int_port" {
  description = "internal port for container"
}
variable "ext_port" {
  description = "external port for container"
}
