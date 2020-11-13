#Jerry Zheng lab1 code 
.data
	f:.asciiz"\nenter value for f:"
	g:.asciiz"\nenter value for g:"
	result:.asciiz"\n The answer to f=g-(f+5) is: "
.text
	main:
	addi $t3,$zero,0
	
	#start of while loop
	while:
	bgt $t3,2 exit
	addi $t3,$t3,1
	#prompts user to enter value for f 
	li $v0,4
	la $a0,f
	syscall
	
	#gets the users number f
	li $v0,5
	syscall
	
	# move value of f into register $t0
	move $t0,$v0
	
	#prompts user to enter value for g
	li $v0,4
	la $a0,g
	syscall
	
	#gets user input for g
	li $v0,5
	syscall
	
	#move value of g into register $s1
	move $s1,$v0
	
	#mdoes the calculation for f=g-(f+5)
	addi $t1,$t0,5
	move $t2,$t1
	sub $t1,$s1,$t2
	
	#show result 
	li,$v0,4
	la,$a0,result 
	syscall
	
	#print the answer
	li $v0,1
	move $a0,$t1
	syscall
	
	#jumps back to the beginning of while loop
	j while 
	
	#exits the loop and ends program
	exit:
	
