#!/bin/bash

# ============================================================

# AWS re/Start - Laboratório 243

# Gerenciamento de Software

#

# Este arquivo documenta os principais comandos utilizados

# durante o laboratório.

#

# A conexão com a instância foi realizada no Windows usando:

# PuTTY + labsuser.ppk + usuário ec2-user

#

# Este arquivo serve como documentação.

# Alguns comandos dependem do ambiente do laboratório e

# não devem ser executados todos de uma vez.

# ============================================================

# ============================================================

# 1. VERIFICAR O DIRETÓRIO

# ============================================================

# Exibe o diretório atual.

pwd

# Caso necessário, entrar no diretório utilizado pelo laboratório.

cd companyA

# ============================================================

# 2. ATUALIZAR O SISTEMA

# ============================================================

# Consulta os repositórios em busca de atualizações disponíveis.

sudo yum -y check-update

# Aplica atualizações relacionadas à segurança.

sudo yum update --security

# Atualiza os pacotes do sistema.

sudo yum -y upgrade

# ============================================================

# 3. INSTALAR O HTTPD

# ============================================================

# Instala o servidor web Apache.

sudo yum install httpd -y

# ============================================================

# 4. CONSULTAR O HISTÓRICO DO YUM

# ============================================================

# Lista as transações realizadas pelo yum.

sudo yum history list

# Consulta informações detalhadas de uma transação.

#

# Substitua <#> pelo ID real apresentado pelo

# comando "sudo yum history list".

sudo yum history info <#>

# ============================================================

# 5. DESFAZER UMA TRANSAÇÃO

# ============================================================

# Desfaz uma transação específica.

#

# Substitua <#> pelo ID real da transação.

sudo yum -y history undo <#>

# ============================================================

# 6. VERIFICAR O PYTHON

# ============================================================

# Verifica a versão instalada do Python 3.

python3 --version

# ============================================================

# 7. VERIFICAR O PIP

# ============================================================

# Verifica se o gerenciador de pacotes pip3 está instalado.

pip3 --version

# ============================================================

# 8. BAIXAR A AWS CLI

# ============================================================

# Baixa o instalador da AWS CLI para Linux 64 bits.

#

# O arquivo será salvo como awscliv2.zip.

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# ============================================================

# 9. EXTRAIR O INSTALADOR

# ============================================================

# Extrai o arquivo de instalação da AWS CLI.

unzip awscliv2.zip

# ============================================================

# 10. INSTALAR A AWS CLI

# ============================================================

# Executa o instalador da AWS CLI.

sudo ./aws/install

# ============================================================

# 11. VERIFICAR A AWS CLI

# ============================================================

# Exibe a documentação de ajuda da AWS CLI.

aws help

# Para sair da tela de ajuda:

# pressione q

# ============================================================

# 12. CONFIGURAR A AWS CLI

# ============================================================

# Inicia o processo de configuração.

aws configure

# Durante o laboratório:

#

# AWS Access Key ID:

# deixar em branco

#

# AWS Secret Access Key:

# deixar em branco

#

# Default region name:

# us-west-2

#

# Default output format:

# json

# ============================================================

# 13. EDITAR O ARQUIVO DE CREDENCIAIS

# ============================================================

# Abre o arquivo de credenciais da AWS CLI.

sudo nano ~/.aws/credentials

# O arquivo pode conter uma estrutura semelhante a:

#

# [default]

# aws_access_key_id=<your access key ID>

# aws_secret_access_key=<your secret access key>

# aws_session_token=<your session token>

#

# NÃO coloque credenciais reais neste arquivo do GitHub.

# No Nano:

#

# Ctrl + O -> salvar

# Enter    -> confirmar o nome do arquivo

# Ctrl + X -> sair

# ============================================================

# 14. CONSULTAR UMA INSTÂNCIA EC2

# ============================================================

# Consulta o atributo instanceType de uma instância EC2.

#

# Substitua <instance-id> pelo Instance ID real da instância

# Command Host.

aws ec2 describe-instance-attribute --instance-id <instance-id> --attribute instanceType

# Exemplo de formato:

#

# aws ec2 describe-instance-attribute \

# --instance-id i-1234567890abcdefg \

# --attribute instanceType

#

# O Instance ID acima é apenas um exemplo.

# ============================================================

# 15. REFERÊNCIA DE CONEXÃO

# ============================================================

# A conexão real do laboratório foi realizada pelo Windows

# usando PuTTY e a chave labsuser.ppk.

#

# Configuração:

#

# Host Name: <PublicIP>

# Port: 22

# Connection type: SSH

#

# Chave:

# Connection > SSH > Auth > Credentials > labsuser.ppk

#

# Usuário:

# ec2-user

# ============================================================

# OBSERVAÇÃO SOBRE PEM

# ============================================================

# O material do laboratório também apresenta um procedimento

# para usuários macOS/Linux utilizando uma chave .pem.

#

# Esse procedimento NÃO foi utilizado na conexão deste

# laboratório.

#

# Exemplo apenas como referência:

#

# chmod 400 labsuser.pem

# ssh -i labsuser.pem ec2-user@<public-ip>

#

# Nunca coloque arquivos .pem ou .ppk no GitHub.

# ============================================================

# OBSERVAÇÃO SOBRE CREDENCIAIS AWS

# ============================================================

# NÃO coloque neste repositório:

#

# aws_access_key_id

# aws_secret_access_key

# aws_session_token

#

# Também não publique:

#

# ~/.aws/credentials

# ~/.aws/config

#

# As credenciais fornecidas pelo laboratório são temporárias

# e devem permanecer fora do repositório.
