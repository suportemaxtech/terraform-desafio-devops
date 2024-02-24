variable "nomes" {
  type = map(any)
  default = {

    "Primeira" : "subnet_a1",
    "Segunda"  : "subnet_b1",
    "Terceira" : "subnet_c1",
    "Quarta"   : "subnet_c1",
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


