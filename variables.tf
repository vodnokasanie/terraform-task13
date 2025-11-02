variable "blue_weight" {
  description = "The traffic weight for the Blue Target Group."
  type        = number
  default     = 100
}

variable "green_weight" {
  description = "The traffic weight for the Green Target Group."
  type        = number
  default     = 0
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "ssh_sg_id" {
  description = "Security Group ID allowing SSH access"
  type        = string
}

variable "http_sg_id" {
  description = "Security Group ID allowing HTTP access to instances"
  type        = string
}

variable "lb_sg_id" {
  description = "Security Group ID allowing HTTP access to Load Balancer"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "desired_capacity" {
  description = "Desired capacity of instances in ASGs"
  type        = number
  default     = 2
}
