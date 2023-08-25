module "dev"{
    source = "../../infra"
    instancia = "Standard_B1s"
    regiao_azure = "brazilsouth"
    nome_usuario = "IaC-DEV"
    nome_maquina = "Maquina.DEV"
    chave_ssh = "Iac-DEV.pub"
    nome_grupo = "IaC-DEV-group"
    nome_rede = "IaC-DEV-rede"
    nome_interface_rede = "IaC-DEV-Interface-rede"
}



