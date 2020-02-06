.data

myArray: .word 3 5 2 1 7
	
units_newline: .asciiz " units.\n" 
	
.text

main:
addi $t9, $zero, 2	 #b=2
	#need to make 2 a hexidecimial number
addi $t1, $zero, 0	# x=0
addi $t2, $zero, 5
loop:
slt $t3, $t1, $t2
beq $t3, $zero, end_main
la $t4, myArray
sll $t5, $t1, 2
add $t6, $t5, $t4
lw $t7, 0($t6) 
slt $t8, $t9, $t7
addi $t0, $zero, 0	
beq $t8, $zero, skip_rick
#rick
sll $t0, $t7, 1
#sub $t0, $s0, $t0
sub $t0, $t0, $t9
	
skip_rick:	
addi $v0, $zero, 1
move $a0, $t0		#addu $a0, $zero, $t0
syscall
addi $v0, $zero, 4
la $a0, units_newline
syscall	
addi $t1, $t1, 1
j loop

end_main:
addi $v0, $zero, 10
syscall
