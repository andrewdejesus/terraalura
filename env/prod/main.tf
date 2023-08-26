module "prod" {
  source              = "../../infra"
  instancia           = "Standard_B1s"
  regiao_azure        = "brazilsouth"
  nome_usuario        = "IaC-PROD"
  nome_maquina        = "Maquina.PROD"
  chave_ssh           = "ssh-prod.pub"
  nome_grupo          = "IaC-PROD-group"
  nome_rede           = "IaC-PROD-rede"
  nome_interface_rede = "IaC-PROD-Interface-rede"
}

output "IP" {
  value = module.prod.IP_publico
}
output "Nome_do_usuário" {
  value = module.prod.username
}

