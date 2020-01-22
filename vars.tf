variable "hw_access_key" {
    type = string
}
variable "hw_secret_key" {
    type = string
}
variable "hw_region" {
    default = "cn-south-1"
    description = "The region name where the resource will be created"
}
variable "hw_az" {
    default = "cn-south-1c"
    description = "The availability zone name where the resource will be created"
}
variable "flavor_name" {
    default = "t6.small.1"
    description = "Define the instance flavor / instance type"
}
variable "image_name" {
    default = "CentOS 7.6 64bit"
    description = "The OS image of instance that we will use"
}
