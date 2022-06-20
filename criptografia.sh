#!/bin/bash
#Cifra de Cesar - programa de criptografia
#Autora - Ananda Krishina / ananda.silva@estudante.ifto.edu.br
#06/06/2022
#O sistema irá pedir e ler um numero de 1-26 que será utilizado como chave para criptografar uma mensagem.
#Em seguida será solicitado e lido a mensagem ou palavra que deseja ser criptografada. o programa mudará as letras e retornará a frase criptografada.
#ex: chave 3 - a->d b->e c->f
#git


### Definição das variáveis

alfabeto=({a..z})               #vetor contendo de a até z, um em cada posição
chave=0                         #chave utilizada para a criptografia
i=0                             #contador
mensagem=''                     #mensagem que será criptografada
letraMensagem=''		#variavel que irá ler cada letra da mensagem separadamente
result=0			#guardará a posição em que cada letra da mensagem está no alfabeto
giro=0				#guardará o valor da posição mais a chave mod 26



### Algoritmo
clear
echo ''
echo '====== INICIAR PROGRAMA - CIFRA DE CÉSAR ======'
echo ''
echo ''






#recebendo a chave

read -p 'Digite a chave: ' chave
while [ $chave -le 0 ] || [ $chave -gt 25 ]; do                  #chave precisa estar entre 1 e 26 que é a quantidade de números do alfabeto
	read -p 'Digite uma chave válida (1-25): ' chave
done

echo '----------------------------------------'

read -p 'Digite a mensagem: ' mensagem
mensagem=${mensagem,,}                        #lendo a mensagem que deseja deixar secreta
echo '----------------------------------------'
echo 'Criptografando...'
sleep 2
echo '3.. 2.. 1..'
sleep 2
echo '----------------------------------------'
echo 'Essa é sua mensagem criptografada!'
echo ''
for (( i=0;i<${#mensagem};i++ )); do
	letraMensagem=${mensagem:$i:1}				#variavel que irá receber a cada repetição uma letra da mensagem
	for (( cont=0;cont<26;cont++ )); do
		if [[ "$letraMensagem" == "${alfabeto[$cont]}" ]]; then
			result=${cont}				#posição original das letras no alfabeto
			giro=$(( ($result + $chave) % 26 ))	#posição com a chave adicionada
			echo -n ${alfabeto[$giro]}
		fi
	done
done
echo ''
echo '---------------------------------------'



