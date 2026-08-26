job "devops-hello" {
  datacenters = ["dc1"]
  type        = "service"

  group "hello" {
    count = 1

    network {
      mode = "bridge"
    }

    task "hello" {
      driver = "docker"

      config {
        image = "devops-hello:1.0"
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}
