#Jerry Zheng 10/29/2020
#reads 3 integers and prints sum of largest 2
.data
numb1:.asciiz"enter first number:"
numb2:.asciiz "enter second number:"
numb3:.asciiz"enter third number:"
result:.asciiz "the result of your two largest numbers is:"

.text
	#gets the number from the user
	main:
	li $v0,4
	la $a0,numb1
	syscall
	
	li $v0,5
	syscall
	
	#moves user input into t0
	move $t0,$v0
	
	#gets the second number from user
	li $v0,4
	la $a0,numb2
	syscall
	
	li $v0,5
	syscall
	
	#stores in t1
	move $t1,$v0
	
	#gets the 3rd number
	li $v0,4
	la $a0,numb3
	syscall
	
	li $v0,5
	syscall
	
	#stores in t2
	move $t2,$v0
	
	# these are the conditions statements 
	bgt $t0,$t1,op2
	bgt $t0,$t2,op1
	bgt $t1,$t0,op3
	bgt $t1,$t2,op1
	bgt $t2,$t0,op3
	bgt $t2,$t1,op2
	
	
	
	
	#label 1
	op1:
	add $t4,$t0,$t1
	li $v0,4
	la $a0,result
	syscall
	li $v0,1
	move $a0,$t4
	syscall
	j exit
	
	#second label
	op2:
	#if 2nd number is greater than 3rd goes to 1st label
	bgt $t1,$t2,op1
	add $t5,$t0,$t2
	li $v0,4
	la $a0,result
	syscall
	li $v0,1
	move $a0,$t5
	syscall
	j exit
	
	
	#label 3
	op3:
	add $t6,$t1,$t2
	li $v0,4
	la $a0,result
	syscall
	li $v0,1
	move $a0,$t6
	syscall
	j exit
	
	#exits the loop and ends the program
	exit:
	
	
	
	
