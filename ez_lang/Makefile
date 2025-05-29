# Comandos do Java
JAVAC = javac
JAVA = java

# Caminho para o JAR do ANTLR
ANTLR_JAR = ../tools/antlr-4.13.2-complete.jar

# Classpath com ANTLR incluso
CLASSPATH = .:$(ANTLR_JAR)

# Comando ANTLR4
ANTLR4 = $(JAVA) -jar $(ANTLR_JAR)

# Nome da gramática (prefixo comum)
GRAMMAR_PREFIX = EZ

# Diretório de saída
OUT_DIR = parser

# Arquivos da gramática
GRAMMARS = EZLexer.g EZParser.g

# Regra principal
all: antlr javac
	@echo "Compilação concluída."

# Compila os arquivos .g4 com ANTLR
antlr:
	$(ANTLR4) -no-listener -o $(OUT_DIR) $(GRAMMARS)

# Compila os arquivos Java gerados
javac:
	$(JAVAC) -cp $(CLASSPATH) $(OUT_DIR)/*.java

# Executa o GRUN com ou sem um arquivo de entrada
# Exemplo de uso: make run FILE=exemplo.ez
run:
ifeq ($(strip $(FILE)),)
	cd $(OUT_DIR) && $(JAVA) -cp $(CLASSPATH) org.antlr.v4.gui.TestRig $(GRAMMAR_PREFIX) program
else
	cd $(OUT_DIR) && $(JAVA) -cp $(CLASSPATH) org.antlr.v4.gui.TestRig $(GRAMMAR_PREFIX) program ../$(FILE)
endif

# Limpa os arquivos gerados
clean:
	@rm -rf $(OUT_DIR)/*.java $(OUT_DIR)/*.class