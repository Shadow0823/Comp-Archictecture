# Jerry Zheng 
#this lab will print the digit into a string 728 seven two eight
.data 
message:.asciiz "Please input a number: "
error:.asciiz " Invalid Entry "
numb0:.asciiz "Zero "
numb1:.asciiz "One "
numb2:.asciiz "Two "
numb3:.asciiz "Three "
numb4:.asciiz "Four "
numb5:.asciiz "Five "
numb6:.asciiz "Six "
numb7:.asciiz "Seven "
numb8:.asciiz "Eight "
numb9:.asciiz "Nine "


.text
main:
 #prompts user to enter number
 li $v0,4
 la $a0, message
 syscall
 
 #reads in integer
 li $v0,5
 syscall
 
 
 # $t0 will contain the reverse number
xor $t0,$t0,$t0

#load 10 into $s5
 li $s5,10
 
 #reverse the input number will need it for later
  while:
  div $v0,$s5
  mflo $v0
  mfhi $s6
  mul $t0,$t0,$s5
  addu $t0,$t0,$s6
  bgtz $v0,while
 
 

 #greater than 0 go to while
 bgt $t0,$zero,divide
 
 #if the number is less than 0 it will print invalid
 slt $s0,$t0,$zero
 beq, $s0,1,invalid

 
 #starts using modulus to get the digits
divide:
blez  $t0, exit
addi $s2,$zero,10
div $t0,$s2
mflo $t0#quotient
mfhi $s3#remainder


#checks condition to see ii it equals then bracnches
 addi $s1,$s1,0
 beq $s3,$s1,printzero
 
  addi $t1,$0,1
 beq $s3,$t1,print1
 
 addi $t2,$0,2
 beq $s3,$t2,print2

 addi $t3,$0,3
 beq $s3,$t3,print3

 addi $t4,$0,4
 beq $s3,$t4,print4

 addi $t5,$0,5
 beq $s3,$t5,print5
 
 addi $t6,$0,6
 beq $s3,$t6,print6
 
 addi $t7,$0,7
 beq $s3,$t7,print7
 
 addi $t8,$0,8
 beq $s3,$t8,print8
 
 addi $t9,$0,9
 beq $s3,$t9,print9
 
 
 #prints the string for the numbers
printzero:
li $v0,4
la $a0,numb0
syscall
j divide

 
print1:
li $v0,4
la $a0,numb1
syscall
j divide
 
print2:
li $v0,4
la $a0,numb2
syscall
j divide

  
print3:
li $v0,4
la $a0,numb3
syscall
j divide

 
print4:
li $v0,4
la $a0,numb4
syscall
j divide
 
print5:
li $v0,4
la $a0,numb5
syscall
j divide
 
print6:
li $v0,4
la $a0,numb6
syscall
j divide

print7:
li $v0,4
la $a0,numb7
syscall
j divide

print8:
li $v0,4
la $a0,numb8
syscall
j divide
 
print9:
li $v0,4
la $a0,numb9
syscall
j divide

#if user enters - # will branch to here
invalid:
 	li $v0,4
 	la $a0,error
	syscall
	j exit

#exits the system
 exit:
 li $v0,10
 
 
 
