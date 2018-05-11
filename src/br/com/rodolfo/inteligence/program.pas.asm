; Código Assembly Questao1.
; Os registradores A0...An sao argumentos de funcoes/procedimentos.
; O registrador V0 guarda retorno de funcoes.

	 LD SP , #stackStart
	 BR main 
main: 
	 ST qtd , #0
	 ST qtdpar , #0
	 ST soma , #0
	 ST maior , #0
$L1:
	 LD R0 , qtd
	 ADD R0 , R0 , #1
	 ST qtd , R0
	 LD R0 , x
	 LD R2 , 
	 LD R0 , x
	 LD R0 , maior
	 LD R0 , x
	 ST maior , R0
	 LD R0 , x
	 ST menor , R0
	 LD R0 , x
	 LD R0 , maior
	 LD R0 , x
	 ST maior , R0
	 LD R0 , x
	 ST menor , R0
	 LD R0 , x
	  R0 , R0 , #2
	 LD R0 , qtdpar
	 ADD R0 , R0 , #1
	 ST qtdpar , R0
	 LD R0 , soma
	 LD R0 , x
	 ADD R0 , R0 , R0
	 ST soma , R0
	 LD R0 , x
	 LD R0 , maior
	 LD R0 , 
	 SUB R1 , R0 , 1
	 BEQZ R1 , $L1
$L2:
	 LD R0 , soma
	 LD R0 , qtdpar
	 DIV R0 , R0 , R0
	 ST media , R0
	 HALT 


