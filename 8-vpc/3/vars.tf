#aula 11
variable "nomes" {
  type = list
  default = [
    {
      "nome"   = "Bastion",
      "subnet" = "subnet_a1"
    },

  ]
}

variable "nomes_privados" {
  type = list
  default = [
 
    {
      "nome"   = "Privada",
      "subnet" = "subnet_b1"
    },
  ]
}

variable subnets {
  type = map
  default = {
    "subnet_a1" = {
      "zona" = "us-east-1a",
      "cdir" = "10.0.64.0/18"
    },

    "subnet_c1" = {
      "zona" = "us-east-1c",
      "cdir" = "10.0.192.0/18"
    },
  }
}

variable "subnets_privada" {
  type = map
  default = {

    "subnet_b1" = {
      "zona" = "us-east-1b",
      "cdir" = "10.0.128.0/18"
    },
  }
}


variable "instance_type" {
  type        = string
  description = "O tipo de vm para criação, Ex: (t2.micro)."

  validation {
    condition     = length(var.instance_type) > 5 && (substr(var.instance_type, 0, 3) == "t1." || substr(var.instance_type, 0, 3) == "t2." || substr(var.instance_type, 0, 3) == "t3.")
    error_message = "Você precisa ter um tipo de instancia válida."
  }
}


