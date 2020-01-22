provider "huaweicloud" {
  # tenant_name = "cn-south-1"
  auth_url    = "https://iam.cn-north-1.myhuaweicloud.com/v3"
  insecure    = "false"
  region      = var.hw_region
  access_key  = var.hw_access_key
  secret_key  = var.hw_secret_key
#  version = "1.4.0"
}
data "huaweicloud_images_image_v2" "os" {
  name = var.image_name
  most_recent = true
}
