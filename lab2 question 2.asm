#Jerry Zheng lab 2 question 2
.data
	r1:.asciiz "\n enter value for register 1:"
	r2:.asciiz"\n enter value for register 2:"
	resultr1:.asciiz "\n result of register 1 = "
	resultr2:.asciiz "\n result of register 2 = "
.text 
	li $v0,4
	la $a0,r1
	syscall
	
	#gets user input for register 1
	li $v0,5
	syscall
	
	#moves input for r1 into to register $t0
	add $t0,$v0,$0
	
	li $v0,4
	la $a0,r2
	syscall
	
	#gets user input for register 2
	li $v0,5
	syscall
	
	#moves user input for register 2 into $t1
	add $t1,$v0,$0
	
	#my swap function
	add $t2,$t1,$0
	add $t1,$t0,$0
	add $t0,$t2,$0
	
	
	li $v0,4
	la,$a0,resultr1
	syscall
	
	#prints out result for register 1
	li $v0,1
	add $a0,$0,$t0
	syscall
	
	li $v0,4
	la,$a0,resultr2
	syscall
	
	#prints out result for register 2
	li $v0,1
	add $a0,$0,$t1
	syscall
	
	
	
	
	
