resource "aws_ami_from_instance" "ami-jenkins" {
  name =  "terraform_jenkin_v0.0.1"
  source_instance_id = "${resource_id}"
}

variable "resource_id" {
    type = string
    description = "Qual o ID da máquina?"
  
}