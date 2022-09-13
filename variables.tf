variable "Main-VPC" {
  description = "Custom VPC in eu-central-1 zone"
  default     = "vpc-0c4b202d96e7494b7"
}

variable "SSH-Web" {
  description = "Security Group that allows ssh, web, rdp services"
  default     = "sg-0317cc82f85990e05"
}
