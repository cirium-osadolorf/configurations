
#Output the IP Address of the Container
output "image_out" {
  value = "${docker_image.image_id.latest}"
}