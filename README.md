# ufes-CC

Repositório da disciplina de compiladores na UFES

## Dependências

Copie o arquivo jar da biblioteca antlr para o diretório tools.
O link direto de download para a vers ̃ao 4.13.2 é https://www.antlr.org/download/antlr-4.13.2-complete.jar.

## Compilação

Entre na pasta do exemplo desejado e modifique o Makefile para o uso correto. Modifique o diretório raiz em ROOT e possívelmente a versão do antlr que você está usando.

Após isso, rode o comando:

`make`

## Execução

Rode o comando para a execução do programa compilado:

`make run`

## Inputs

Alguns exemplos possuem casos de teste em uma pasta "inputs". Rode-os com o seguinte comando:

`make run FILE=../inputs/nome_do_arquivo.ezl`

Note que o arquivo deve ser acessado com ../ já que o programa roda a partir do diretório auxiliar lexer.
