.text

SUM:
	li $t0, 1
	beq $a1, $t0, open
	j close
	
	open:
	add $t1, $a0, $t0
	mul $t2, $a0, $t1
	li $t3, 2
	div $t2, $t3
	mflo $t4
	move $v0, $t4
	jr $ra
	
	close:
	sub $t5, $a1, $t0
	
	addi $sp, $sp, -12
        sw $ra, 0($sp)
        sw $a0, 4($sp)   
        sw $a1, 8($sp)
	move $a1, $t5
	lw $a1, 8($sp)
        lw $a0, 4($sp)
        lw $ra, 0($sp)
        addi $sp, $sp, 12
        
        li $t3, 2
        move $t6, $v0
        add $t7, $t6, $t0
        mul $t8, $t7, $t6
        div $t8, $t3
        mflo $t9
        move $v0, $t9
	jr $ra

strlen:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	
	li $v0, 0
	move $s0, $a0
	li $t0, 0
	li $t1, 0x00

	while:
	lb $s1, 0($s0)
	beq $s1, $t1, leave
	addi $s0, $s0, 1
	addi $v0, $v0, 1
	j while

	leave:
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 8
	jr $ra
