.data

.text

jerry:	
	addi $a0, $a0, 0x2
	addi $t1, $zero, 0x3	
	mult $a0, $t1
	mflo $v0			
	jr $ra
morty:
	addiu $sp, $sp,0xFFFFFFF4 	#-12	#have to put -12 into hex
	sw $s0, 0($sp)	#for y
	sw $s1, 4($sp)	#for  m
	sw $ra, 8($sp)  
	
	sll $a0, $a0, 1			#this part does int m = jerry(2*y - 6)
	addi $t2, $zero, 0x6
	sub $a0, $a0, $t2 
	add $s0, $zero, $a0

	jal jerry

					#this part does int n = jerry(m)
	add $s1, $zero, $v0
	add $a0, $zero, $v0 	
	
	jal jerry
				#this part does n + m ;
	add $v0, $v0, $s1	#maybe need to save an additonal spot on stack for answer?

	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addiu $sp, $sp, 0xC 	

	jr $ra
	
main:
	addi $a0, $zero, 0x5
	jal morty
	sll $s1, $v0, 2
 	add $a0, $zero, $s1		
	addi $v0, $zero, 0x1
	syscall

	addi $v0, $zero, 0xA
	syscall
