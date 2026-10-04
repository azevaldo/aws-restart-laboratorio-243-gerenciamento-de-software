# AWS re/Start — Laboratório 243: Gerenciamento de Software

Este laboratório apresenta conceitos de gerenciamento de software em um ambiente Linux, utilizando o gerenciador de pacotes `yum` para consultar e atualizar pacotes, visualizar o histórico de transações e desfazer uma instalação. Também foi realizada a instalação e configuração da AWS CLI para executar comandos da AWS diretamente pelo terminal.

## Objetivos

* Consultar atualizações disponíveis no Linux.
* Aplicar atualizações de segurança.
* Atualizar os pacotes do sistema utilizando o `yum`.
* Instalar o pacote `httpd`.
* Consultar o histórico de transações do `yum`.
* Visualizar informações de uma transação específica.
* Desfazer uma transação utilizando o `yum history undo`.
* Verificar a instalação do Python e do `pip3`.
* Instalar a AWS CLI.
* Configurar a AWS CLI.
* Utilizar a AWS CLI para consultar informações de uma instância EC2.

## Ambiente

* **AWS re/Start**
* **AWS Vocareum**
* **Amazon EC2**
* **Amazon Linux**
* **SSH**
* **Windows**
* **PuTTY**
* **Chave:** `labsuser.ppk`
* **Usuário:** `ec2-user`

---

## 1. Conexão com a instância EC2

Neste laboratório, a conexão com a instância EC2 foi realizada utilizando o PuTTY no Windows.

Configuração utilizada:

```text
Host Name: <PublicIP>
Port: 22
Connection type: SSH
```

A chave `labsuser.ppk` foi configurada em:

```text
Connection > SSH > Auth > Credentials
```

Após estabelecer a conexão, foi utilizado o usuário:

```text
ec2-user
```

> A chave privada utilizada para a conexão não deve ser enviada para o GitHub.

---

## 2. Atualizar a máquina Linux

Primeiro, foi verificado o diretório atual:

```bash
pwd
```

O laboratório utiliza o diretório:

```text
/home/ec2-user/companyA
```

Caso necessário:

```bash
cd companyA
```

### Verificar atualizações disponíveis

Para consultar os repositórios e verificar atualizações disponíveis:

```bash
sudo yum -y check-update
```

Esse comando verifica se existem pacotes disponíveis para atualização.

### Aplicar atualizações de segurança

Para aplicar atualizações relacionadas à segurança:

```bash
sudo yum update --security
```

### Atualizar os pacotes

Para atualizar os pacotes do sistema:

```bash
sudo yum -y upgrade
```

O laboratório informa que a instância pode já estar atualizada. Nesse caso, os comandos ainda podem ser executados para prática.

---

## 3. Instalar o httpd

Para instalar o servidor web Apache:

```bash
sudo yum install httpd -y
```

Além de realizar a instalação, o comando também gera uma transação que pode ser consultada posteriormente no histórico do `yum`.

---

## 4. Consultar o histórico do yum

O `yum` mantém um histórico das operações realizadas no sistema.

Para visualizar o histórico:

```bash
sudo yum history list
```

O resultado apresenta informações como:

* ID da transação;
* Usuário responsável;
* Data e hora;
* Ações realizadas;
* Quantidade de alterações.

Um exemplo de estrutura apresentada pelo comando:

```text
ID | Login user | Date and time | Action(s) | Altered
```

O número da transação necessária para os próximos passos deve ser identificado no resultado apresentado pelo próprio ambiente.

---

## 5. Consultar informações de uma transação

Depois de identificar o ID da transação, foi utilizado:

```bash
sudo yum history info <#>
```

Substitua `<#>` pelo ID real da transação.

Exemplo:

```bash
sudo yum history info 2
```

O comando apresenta informações detalhadas da transação, como:

* Transaction ID;
* Begin time;
* End time;
* Usuário;
* Return-Code;
* Command Line.

> O número da transação pode variar de acordo com o estado da instância. Por isso, deve ser utilizado o ID apresentado pelo `yum history list`.

---

## 6. Desfazer uma transação

Depois de consultar a transação, o laboratório utiliza o `yum history undo` para desfazê-la.

Comando:

```bash
sudo yum -y history undo <#>
```

Exemplo:

```bash
sudo yum -y history undo 2
```

O `<#>` deve ser substituído pelo ID real da transação.

Essa operação desfaz as alterações associadas à transação selecionada, conforme o histórico do `yum`.

---

## 7. Verificar o Python

Para verificar se o Python está instalado:

```bash
python3 --version
```

O comando apresenta a versão do Python disponível na máquina.

O laboratório utiliza o Python como parte dos requisitos relacionados à instalação da AWS CLI.

---

## 8. Verificar o pip

Para verificar se o `pip3` está instalado:

```bash
pip3 --version
```

Caso o comando apresente uma mensagem indicando que `pip` não foi encontrado, significa que o pacote não está instalado no ambiente.

O `pip` é um gerenciador de pacotes para Python.

---

## 9. Baixar a AWS CLI

A instalação da AWS CLI foi realizada utilizando o instalador oficial disponibilizado em formato `.zip`.

Para baixar o instalador:

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

O arquivo baixado é:

```text
awscliv2.zip
```

---

## 10. Extrair o instalador

Para extrair o arquivo:

```bash
unzip awscliv2.zip
```

Esse comando cria um diretório chamado:

```text
aws
```

---

## 11. Instalar a AWS CLI

Depois de extrair o instalador:

```bash
sudo ./aws/install
```

O instalador utiliza o diretório `/usr/local/aws-cli` e cria um link simbólico em `/usr/local/bin`, conforme descrito no laboratório.

---

## 12. Verificar a AWS CLI

Para verificar se a AWS CLI está funcionando:

```bash
aws help
```

Esse comando apresenta a ajuda da AWS CLI.

A saída é exibida em um visualizador de texto. Para sair:

```text
q
```

---

## 13. Configurar a AWS CLI

Para iniciar a configuração:

```bash
aws configure
```

Durante o laboratório, foram utilizados os seguintes valores:

```text
AWS Access Key ID: deixar em branco
AWS Secret Access Key: deixar em branco
Default region name: us-west-2
Default output format: json
```

As credenciais utilizadas no laboratório foram fornecidas pelo ambiente do AWS Vocareum.

> **Importante:** não coloque `aws_access_key_id`, `aws_secret_access_key` ou `aws_session_token` reais neste repositório.

---

## 14. Arquivo de credenciais

O laboratório orienta abrir o arquivo de credenciais com:

```bash
sudo nano ~/.aws/credentials
```

Nesse arquivo foram inseridas as credenciais fornecidas pelo ambiente do laboratório.

A estrutura esperada é semelhante a:

```text
[default]
aws_access_key_id=<your access key ID>
aws_secret_access_key=<your secret access key>
aws_session_token=<your session token>
```

Os valores reais das credenciais **não fazem parte deste repositório**.

No Nano:

```text
Ctrl + O
```

salva o arquivo.

Depois:

```text
Ctrl + X
```

fecha o editor.

---

## 15. Localizar a instância EC2

No AWS Management Console, foi acessado o serviço:

```text
EC2
```

Depois:

```text
Instances (running)
```

O laboratório utiliza uma instância chamada:

```text
Command Host
```

Foi necessário identificar e copiar o **Instance ID** dessa instância.

O ID possui um formato semelhante a:

```text
i-1234567890abcdefg
```

> O Instance ID é específico do ambiente do laboratório e não deve ser substituído por um valor inventado no repositório.

---

## 16. Consultar informações da instância usando AWS CLI

Depois de obter o Instance ID, foi utilizado o comando:

```bash
aws ec2 describe-instance-attribute --instance-id <instance-id> --attribute instanceType
```

Exemplo:

```bash
aws ec2 describe-instance-attribute --instance-id i-1234567890abcdefg --attribute instanceType
```

A resposta apresenta informações sobre o tipo da instância.

Exemplo de saída:

```json
{
    "InstanceId": "i-1234567890abcdefg",
    "InstanceType": {
        "Value": "t3.micro"
    }
}
```

O Instance ID apresentado acima é apenas um exemplo. No laboratório deve ser utilizado o ID real da instância `Command Host`.

---

## 17. Principais comandos

```bash
# Verificar atualizações
sudo yum -y check-update

# Aplicar atualizações de segurança
sudo yum update --security

# Atualizar pacotes
sudo yum -y upgrade

# Instalar Apache
sudo yum install httpd -y

# Consultar histórico
sudo yum history list

# Consultar uma transação
sudo yum history info <#>

# Desfazer uma transação
sudo yum -y history undo <#>

# Verificar Python
python3 --version

# Verificar pip
pip3 --version

# Baixar AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Extrair instalador
unzip awscliv2.zip

# Instalar AWS CLI
sudo ./aws/install

# Abrir ajuda da AWS CLI
aws help

# Configurar AWS CLI
aws configure

# Consultar tipo da instância
aws ec2 describe-instance-attribute --instance-id <instance-id> --attribute instanceType
```

---

## 18. Conceitos praticados

### Yum

Gerenciador de pacotes utilizado no ambiente Linux do laboratório para consultar, instalar, atualizar e reverter pacotes.

### Yum History

Recurso utilizado para consultar as transações realizadas pelo gerenciador de pacotes.

### `history info`

Permite consultar informações detalhadas de uma determinada transação.

### `history undo`

Permite desfazer uma transação selecionada do histórico.

### AWS CLI

Interface de linha de comando utilizada para interagir com serviços da AWS diretamente pelo terminal.

### `aws configure`

Comando utilizado para configurar parâmetros da AWS CLI.

### `aws ec2 describe-instance-attribute`

Comando utilizado para consultar atributos de uma instância EC2.

---

## 19. Aprendizados

Neste laboratório, foram praticados:

* Gerenciamento de pacotes no Linux;
* Atualização do sistema;
* Aplicação de atualizações de segurança;
* Instalação de pacotes utilizando `yum`;
* Consulta do histórico de transações;
* Identificação de transações específicas;
* Reversão de uma transação;
* Verificação do Python e do `pip`;
* Download e instalação da AWS CLI;
* Configuração da AWS CLI;
* Utilização da AWS CLI para consultar recursos EC2.

## 20. Arquivos do repositório

```text
aws-restart-laboratorio-243-gerenciamento-de-software/
├── README.md
├── comandos.sh
└── .gitignore
```

### `README.md`

Documentação do laboratório, incluindo os procedimentos realizados, comandos e principais conceitos aprendidos.

### `comandos.sh`

Lista dos comandos utilizados durante o laboratório, acompanhados de comentários explicativos.

### `.gitignore`

Define arquivos que não devem ser enviados para o GitHub, incluindo chaves privadas, credenciais e arquivos temporários.

## Conclusão

O laboratório permitiu praticar o gerenciamento de software em um ambiente Linux utilizando o `yum`, desde a consulta e aplicação de atualizações até a análise e reversão de transações.

Também foi realizada a instalação e configuração da AWS CLI, permitindo utilizar o terminal para consultar informações de recursos da AWS, como atributos de uma instância EC2.
