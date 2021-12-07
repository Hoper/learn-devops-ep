variable "profile" {
  type    = string
  default = "my-awsuser"
}

variable "region-master" {
  type    = string
  default = "us-east-1"
}

variable "region-worker" {
  type    = string
  default = "us-west-2"
}

variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "workers-count" {
  type    = number
  default = 2
}

variable "web-count" {
  type    = number
  default = 2
}