.data
	w:.asciiz "\n enter value for w: "
	x:.asciiz "\n enter value for x: "
	y:.asciiz "\n enter value for y: "
	z:.asciiz "\n enter value for z: "
	result:.asciiz "\n x = "
.text
	#prints message for w
	li $v0,4
	la $a0,w
	syscall
	
	#gets user input of w
	li $v0,5
	syscall
	
	move $t0,$v0
	
	#prints message for x
	li $v0,4
	la $a0,x
	syscall
	
	#gets user input of x
	li $v0,5
	syscall
	
	move $t1,$v0
	
	#prints message for y
	li $v0,4
	la $a0,y
	syscall
	
	#gets user input of y
	li $v0,5
	syscall
	move $t2,$v0
	
	#prints message fror z
	li $v0,4
	la $a0,z
	syscall
	
	#gets user input of z
	li $v0,5
	syscall
	move $t3,$v0
	
	#x-y stored in $s0
	sub $s0,$t1,$t2
	
	beq $s0,$t0 true
	bgt $s0,$t0 true
	blt $s0,$t0 false
	
	#if x-y>=to w is true then execute following code
	true:
	li $v0,4
	la $a0,result
	syscall
	
	#sets x to y
	li $v0,1
	move $s3,$t1
	move $t1,$t2
	move $a0,$t1
	syscall 
	
	j exit
	
	#else statement
	false:
	li $v0,4
	la $a0,result
	syscall
	
	#sets x to z
	li $v0,1
	move $s4,$t1
	move $t1,$t3
	move $a0,$t1
	syscall 

	exit:
	
	
	
	


	
