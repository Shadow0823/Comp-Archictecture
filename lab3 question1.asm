#Jerry Zheng 10/29/2020
#this porgram is a adding machine keeps aadding numbers until you enter 0
.data
	message:.asciiz "please enter the digit you want to add, enter 0 to print out result:"
	result:.asciiz " x = "

.text
	
	main:
	#while loop
	while:
	
	#user keeps entering number 
	li $v0,4
	la $a0,message
	syscall
	

	li $v0,5
	syscall
	
	#if the user inputs 0 goes to exit
	beq $v0,$0 exit
	#keeps adding the numbers f it is not 0
	add $t0,$t0,$v0
	j while
	
	exit:
	
	#prints out the result of x
	li $v0,4
	la, $a0,result
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	
	#exits the program
	li $v0,10
