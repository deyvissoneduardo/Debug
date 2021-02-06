#!/usr/bin/env bash
#
# debug.sh - debugar funções .sh
#
#
# Autor:      Deyvisson Eduardo
# Manutenção: Deyvisson Eduardo
#
# ------------------------------------------------------------------------ #
#  Debugar uma funçao com possibilidade de 2 niveis.
# 
#
#  Exemplos:
#      $ ./debug.sh -d 1
#      Neste exemplo o script será executado no modo debug nível 1.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 06/02/2021
#   v1.0 Criado a função de debug     
#
#
# ------------------------------- VARIÁVEIS ----------------------------------------- #
CHAVE_DEBUG=0
NIVEL_DEBUG=0
MENSAGEM_USO="
    $(basename $0) [OPÇÕES]

    -h   - Menu de ajuda
    -v   - Versão
    -d 1 - Nivel de Debug 1
    -d 2 - Nivel de Debug 2
"
VERSAO="v1.0"
# ------------------------------- FUNÇÃO ----------------------------------------- #
# paramentro menor ou igual ao NIVEL_DEBUG
Debugar(){
	[ $1 -le $NIVEL_DEBUG ] && echo "Debug $* -----------"
}


Soma(){
	local total=0
	for i in $(seq 1 25)
       	do 
		Debugar 1 "Entrei com valor: $i"
		total=$(($total+$i))
		Debugar 2 "Sair com valor: $total"
	done
}
# -------------------------------- EXECUÇÃO ---------------------------------------- #
case "$1" in
	-h) echo "$MENSAGEM_USO" && exit 0 ;;
    -v) echo "$VERSAO" && exit 0 ;;
	-d) [ $2 ] && NIVEL_DEBUG=$2 ;;
	*) Soma ;;
esac

Soma
