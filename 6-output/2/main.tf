variable "estados" {
  type = list(string)
  default    =  [
    "AC",
    "AL",
    "AP",
    "AC",
    "AL",
    "BA",
    "CE",
    "DF",
    "ES",
    "GO",
    "MA",
    "MS",
    "MT",
    "MG",
    "PA",
    "PB",
    "PR",
    "PE",
    "PI",
    "RJ",
    "RN",
    "RS",
    "RO",
    "RR",
    "SC",
    "SP",
    "SE",
    "TO"
  ]
}



output estados {
  value       = var.estados[length(var.estados)-1]
}



