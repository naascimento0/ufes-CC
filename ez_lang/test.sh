#!/bin/bash

set -e

MODE=$1

if [[ "$MODE" != "lexer" && "$MODE" != "parser" ]]; then
    echo "Uso: ./test.sh [lexer|parser]"
    exit 1
fi

# Caminhos
ANTLR_JAR="./../tools/antlr-4.13.2-complete.jar"
GRAMMAR_PREFIX="EZ"
GRAMMARS="EZLexer.g EZParser.g"
OUT_DIR="parser"
INPUT_DIR="inputs"
OUTPUT_DIR="outputs"
GEN_DIR="generated/$MODE"
CLASSPATH=".:$ANTLR_JAR:$OUT_DIR"

# Compilação
echo "[1/5] Limpando diretórios antigos..."
rm -rf $OUT_DIR $GEN_DIR
mkdir -p $OUT_DIR $GEN_DIR

echo "[2/5] Compilando gramáticas..."
java -jar $ANTLR_JAR -no-listener -o $OUT_DIR $GRAMMARS

echo "[3/5] Compilando Java..."
javac -cp $CLASSPATH $OUT_DIR/*.java

# Teste
echo "[4/5] Executando GRUN para arquivos .ezl (${MODE})..."
for file in $INPUT_DIR/*.ezl; do
    base=$(basename "$file" .ezl)
    output_file="$GEN_DIR/$base.out"

    if [[ "$MODE" == "lexer" ]]; then
        java -cp $CLASSPATH org.antlr.v4.gui.TestRig $GRAMMAR_PREFIX tokens -tokens "$file" > "$output_file"
    else
        java -cp $CLASSPATH org.antlr.v4.gui.TestRig $GRAMMAR_PREFIX program "$file" > "$output_file" 2>&1
    fi
done

# Comparação
EXPECTED_DIR="$OUTPUT_DIR/Lab01"
[[ "$MODE" == "parser" ]] && EXPECTED_DIR="$OUTPUT_DIR/Lab02"

echo "[5/5] Comparando saídas com '$EXPECTED_DIR'..."
diff -r -q "$GEN_DIR" "$EXPECTED_DIR"

echo "Testes finalizados."
