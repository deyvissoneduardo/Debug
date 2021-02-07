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
#   v1.0 06/02/2021 Deyvison Eduardo
#   v1.0 Criado a função de debug     
#   v1.1 Formatação de mensagens
#
# ------------------------------- VARIÁVEIS ----------------------------------------- #
KEY_DEBUG=0
LEVEL_DEBUG=0
MESSAGE_HELP="
    $(basename $0) [OPÇÕES]

    -h   - Menu de ajuda
    -v   - Versão
    -d 1 - Nivel de Debug 1
    -d 2 - Nivel de Debug 2
"
VERSION="v1.1"


NEGRITO="\033[1m"
COLOR_DEBUG_1="\033[34;1m"
COLOR_DEBUG_2="\033[31;1m"
# ------------------------------- FUNÇÃO ----------------------------------------- #
# paramentro menor ou igual ao LEVEL_DEBUG
Debugar(){
	[ $1 -le $LEVEL_DEBUG ] && echo -e "${2}Debug --- $* ---"
}


ADD(){
	local result=0
	for i in $(seq 1 25)
       	do 
		Debugar 1 "${COLOR_DEBUG_1}" "--- Entrei com valor: $i"
		result=$(($result+$i))
		Debugar 2  "${COLOR_DEBUG_2}" "--- Sair com valor: $result"
	done
}
# -------------------------------- EXECUÇÃO ---------------------------------------- #
case "$1" in
	-h) echo -e "${NEGRITO}$MESSAGE_HELP" && exit 0 ;;
    -v) echo -e "${NEGRITO}$VERSION" && exit 0 ;;
	-d) [ $2 ] && LEVEL_DEBUG=$2 ;;
	*) ADD ;;
esac

ADD
