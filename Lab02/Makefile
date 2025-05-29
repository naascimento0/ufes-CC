# Comando do compilador Java
JAVAC = javac
# Comando da JVM
JAVA = java

# ROOT aponta para a raiz do repositório, subindo um nível
ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/..)

# Caminho para o JAR do ANTLR (versão específica do Lab02)
ANTLR_PATH := $(ROOT)/tools/antlr-4.13.2-complete.jar

# Opção de configuração do CLASSPATH para o ambiente Java
CLASS_PATH_OPTION = -cp .:$(ANTLR_PATH)

# Comando para executar o ANTLR
ANTLR4 = $(JAVA) -jar $(ANTLR_PATH)

# Ambiente de testes
GRUN = $(JAVA) $(CLASS_PATH_OPTION) org.antlr.v4.gui.TestRig

# Espera-se que a variável GRAMMAR seja definida na linha de comando: make GRAMMAR=path/Exemplo01.g
ifndef GRAMMAR
$(error É necessário passar a variável GRAMMAR, ex: make GRAMMAR=subdir/Exemplo01.g)
endif

# Nome base da gramática (sem path e sem extensão)
GRAMMAR_NAME := $(basename $(notdir $(GRAMMAR)))

# Diretório onde os arquivos gerados serão salvos
GEN_DIR := $(dir $(GRAMMAR))
GEN_PATH := $(GEN_DIR)parser

# Executa o ANTLR e o compilador Java
all: antlr javac
	@echo "Compilação completa."

# Gera arquivos do ANTLR sem listeners
antlr:
	cd $(GEN_DIR) && $(ANTLR4) -no-listener -o parser $(notdir $(GRAMMAR))

# Compila os arquivos Java gerados
javac:
	$(JAVAC) $(CLASS_PATH_OPTION) $(GEN_PATH)/*.java

run:
ifeq ($(strip $(FILE)),)
	cd $(GEN_PATH) && $(GRUN) $(GRAMMAR_NAME) begin -tokens
else
	cd $(GEN_PATH) && $(GRUN) $(GRAMMAR_NAME) begin -tokens ../$(FILE)
endif

# Limpa os arquivos gerados
clean:
	@rm -rf $(GEN_PATH)
