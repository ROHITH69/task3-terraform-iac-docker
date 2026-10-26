provider "docker" {
  host = "unix:///Users/rohithnemalipuri/.docker/run/docker.sock"
}

resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_container" "task3" {
  name  = "task3-terraform-nginx"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.host_port
  }

  restart = "unless-stopped"
}
