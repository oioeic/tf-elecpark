provider "huaweicloud" {
  #tenant_name = "elecpark"
  auth_url    = "https://iam.cn-north-1.myhuaweicloud.com/v3"
  insecure    = "false"
  region      = var.hw_region
  access_key  = var.hw_access_key
  secret_key  = var.hw_secret_key
}
data "huaweicloud_images_image_v2" "os" {
  name = var.image_name
  most_recent = true
}
resource "huaweicloud_networking_router_v2" "router" {
  name             = "router_example"
  admin_state_up   = "true"
}

resource "huaweicloud_networking_network_v2" "network" {
  name           = "network_example"
  admin_state_up = "true"
}

resource "huaweicloud_networking_subnet_v2" "subnet" {
  name            = "subnet_example"
  network_id      = huaweicloud_networking_network_v2.network.id
  cidr            = "172.10.100.0/24"
  ip_version      = 4
  dns_nameservers = ["100.125.1.250", "114.114.115.115"]
}

resource "huaweicloud_networking_router_interface_v2" "interface" {
  router_id = huaweicloud_networking_router_v2.router.id
  subnet_id = huaweicloud_networking_subnet_v2.subnet.id
}

resource "huaweicloud_compute_instance_v2" "server_example" {
  region = var.hw_region
  availability_zone = var.hw_az
  name            = "server_test"
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  security_groups = ["default"]
  network {
    uuid = huaweicloud_networking_network_v2.network.id
  }
}

output "instance_address" {
    value = huaweicloud_compute_instance_v2.server_example.access_ip_v4
}
