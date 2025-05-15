# ufes-CC

Repositório da disciplina de compiladores na UFES

## Dependências

Crie um diretório "tools" dentro da raíz e copie o arquivo jar da biblioteca antlr para lá.
O link direto de download para a versão 4.13.2 é https://www.antlr.org/download/antlr-4.13.2-complete.jar.

## Compilação

Antes de compilar, centifique-se de que o Makefile está coerente com a versão do antlr que você está usando (modificando a variável ANTL_PATH).

Após isso, rode o comando:

`make GRAMMAR=<caminho_da_linguagem>.g`

## Execução

Rode o comando para a execução do programa compilado:

`make run GRAMMAR=<caminho_da_linguagem>.g`

## Inputs

Alguns exemplos possuem casos de teste em uma pasta "inputs". Rode-os com o seguinte comando:

`make run GRAMMAR=<caminho_da_linguagem>.g FILE=../inputs/<nome_do_input>.ezl`

Note que o arquivo deve ser acessado com ../ já que o programa roda a partir do diretório auxiliar lexer.
