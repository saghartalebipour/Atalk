main:
move $t4, $gp
move $t2, $sp
li $t5, 0
#allocating buffer for actor
addiu $sp, $sp,-64
#end of allocating buffer for actor
#allocating space for actor unread count
li $a0,0
sw $a0, 0($gp)
addiu $gp, $gp, 4
#end of allocating space for actor unread count
#allocating buffer for actor
addiu $sp, $sp,-48
#end of allocating buffer for actor
#allocating space for actor unread count
li $a0,0
sw $a0, 0($gp)
addiu $gp, $gp, 4
#end of allocating space for actor unread count
move $fp, $sp
#adding init message for actor0
li $a0, 0
li $a2, -1
mul $a0, $a0, $a2
add $a0, $a0, $t2
li $a1,0
sw $a1, 0($a0)
li $a1,0
sw $a1, -4($a0)
move $a1, $t5
add $a1, $a1, $gp
sw $a1, -8($sp)
sw $a1, -12($sp)
lw $a1, 0($t4)
addi $a1, $a1, 1
sw $a1, 0($t4)
#end of adding init message for actor0
mainloop:
li $t7,1
j a0
enda0:
j a1
enda1:
li $t6,1
beq $t7, $t6, progend
j mainloop
a0:
lw $a0, 0($t4)
beqz $a0 enda0
li $t7, 0
addi $a0, -1
sw $a0, 0($t4)
li $a0, 0
li $a2, -1
mul $a0, $a0, $a2
add $a0, $a0, $t2
addi $a0, $a0, -4
move $a1, $a0
addi $a1, $a1, -4
move $a2, $a1
addi $a2, $a2, -4
lw $a1, 0($a1)
lw $a2, 0($a2)
argcondition0:
beq $a1, $a2, argend0
addi $a2, $a2, -4
lw $a3, 0($a2)
sw $a3, 0($sp)
addi $sp, $sp, -4
j argcondition0
argend0:
add $a1, $a0, 4
lw $a0, 0($a0)
lw $a2,-16($a1)
sw $a2,0($a1)
lw $a2,-12($a1)
sw $a2,4($a1)
lw $a2,-8($a1)
sw $a2,8($a1)
lw $a2,-4($a1)
sw $a2,12($a1)
lw $a2,-32($a1)
sw $a2,-16($a1)
lw $a2,-28($a1)
sw $a2,-12($a1)
lw $a2,-24($a1)
sw $a2,-8($a1)
lw $a2,-20($a1)
sw $a2,-4($a1)
lw $a2,-48($a1)
sw $a2,-32($a1)
lw $a2,-44($a1)
sw $a2,-28($a1)
lw $a2,-40($a1)
sw $a2,-24($a1)
lw $a2,-36($a1)
sw $a2,-20($a1)
li $a1,0
beq $a0, $a1, r0
li $a1,1
beq $a0, $a1, r1
a1:
lw $a0, 4($t4)
beqz $a0 enda1
li $t7, 0
addi $a0, -1
sw $a0, 4($t4)
li $a0, 64
li $a2, -1
mul $a0, $a0, $a2
add $a0, $a0, $t2
addi $a0, $a0, -4
move $a1, $a0
addi $a1, $a1, -4
move $a2, $a1
addi $a2, $a2, -4
lw $a1, 0($a1)
lw $a2, 0($a2)
argcondition1:
beq $a1, $a2, argend1
addi $a2, $a2, -4
lw $a3, 0($a2)
sw $a3, 0($sp)
addi $sp, $sp, -4
j argcondition1
argend1:
add $a1, $a0, 4
lw $a0, 0($a0)
lw $a2,-16($a1)
sw $a2,0($a1)
lw $a2,-12($a1)
sw $a2,4($a1)
lw $a2,-8($a1)
sw $a2,8($a1)
lw $a2,-4($a1)
sw $a2,12($a1)
lw $a2,-32($a1)
sw $a2,-16($a1)
lw $a2,-28($a1)
sw $a2,-12($a1)
lw $a2,-24($a1)
sw $a2,-8($a1)
lw $a2,-20($a1)
sw $a2,-4($a1)
li $a1,0
beq $a0, $a1, r0
li $a1,1
beq $a0, $a1, r1
#begining scope0
#begining scope0
#start adding label
r0:
#end adding label
#begining scope0
#start sending message
lw $a1, 4($t4)
li $a3, 3
beq $a1, $a3, ActorBufferError8
mul $a1, $a1, 16
addi $a1, $a1,64
li $a2, -1
mul $a1, $a1, $a2
li $a0,1
add $a2, $a1, $t2
sw $a0, 0($a2)
li $a0,1
sub $a2, $a2, 4
sw $a0, 0($a2)
move $a0, $t5
add $a0, $a0, $gp
sub $a2, $a2, 4
sw $a0, 0($a2)
add $a0, $t5, $gp
sub $a2, $a2, 4
sw $a0, 0($a2)
lw $a1, 4($t4)
addi $a1, $a1, 1
sw $a1, 4($t4)
j, endsendmessage8
ActorBufferError8:
li $a0,'A'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'c'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'t'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'B'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'u'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'e'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'O'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'v'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'e'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'l'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'w'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'E'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
addi $a0, $zero, 10
# start syscall 11
li $v0, 11
syscall
# end syscall
#end of sending message
endsendmessage8:
#start sending message
lw $a1, 4($t4)
li $a3, 3
beq $a1, $a3, ActorBufferError9
mul $a1, $a1, 16
addi $a1, $a1,64
li $a2, -1
mul $a1, $a1, $a2
li $a0,1
add $a2, $a1, $t2
sw $a0, 0($a2)
li $a0,1
sub $a2, $a2, 4
sw $a0, 0($a2)
move $a0, $t5
add $a0, $a0, $gp
sub $a2, $a2, 4
sw $a0, 0($a2)
add $a0, $t5, $gp
sub $a2, $a2, 4
sw $a0, 0($a2)
lw $a1, 4($t4)
addi $a1, $a1, 1
sw $a1, 4($t4)
j, endsendmessage9
ActorBufferError9:
li $a0,'A'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'c'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'t'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'B'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'u'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'e'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'O'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'v'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'e'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'l'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'w'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'E'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
addi $a0, $zero, 10
# start syscall 11
li $v0, 11
syscall
# end syscall
#end of sending message
endsendmessage9:
#start sending message
lw $a1, 4($t4)
li $a3, 3
beq $a1, $a3, ActorBufferError10
mul $a1, $a1, 16
addi $a1, $a1,64
li $a2, -1
mul $a1, $a1, $a2
li $a0,1
add $a2, $a1, $t2
sw $a0, 0($a2)
li $a0,1
sub $a2, $a2, 4
sw $a0, 0($a2)
move $a0, $t5
add $a0, $a0, $gp
sub $a2, $a2, 4
sw $a0, 0($a2)
add $a0, $t5, $gp
sub $a2, $a2, 4
sw $a0, 0($a2)
lw $a1, 4($t4)
addi $a1, $a1, 1
sw $a1, 4($t4)
j, endsendmessage10
ActorBufferError10:
li $a0,'A'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'c'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'t'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'B'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'u'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'e'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'O'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'v'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'e'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'l'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'w'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'E'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
addi $a0, $zero, 10
# start syscall 11
li $v0, 11
syscall
# end syscall
#end of sending message
endsendmessage10:
#start sending message
lw $a1, 4($t4)
li $a3, 3
beq $a1, $a3, ActorBufferError11
mul $a1, $a1, 16
addi $a1, $a1,64
li $a2, -1
mul $a1, $a1, $a2
li $a0,1
add $a2, $a1, $t2
sw $a0, 0($a2)
li $a0,1
sub $a2, $a2, 4
sw $a0, 0($a2)
move $a0, $t5
add $a0, $a0, $gp
sub $a2, $a2, 4
sw $a0, 0($a2)
add $a0, $t5, $gp
sub $a2, $a2, 4
sw $a0, 0($a2)
lw $a1, 4($t4)
addi $a1, $a1, 1
sw $a1, 4($t4)
j, endsendmessage11
ActorBufferError11:
li $a0,'A'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'c'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'t'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'B'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'u'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'e'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'O'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'v'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'e'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'l'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'w'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'E'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
addi $a0, $zero, 10
# start syscall 11
li $v0, 11
syscall
# end syscall
#end of sending message
endsendmessage11:
li $t0, 0
add $t0, $fp, $t0
move $sp, $t0
#ending scope
j enda0
li $t0, 0
add $t0, $fp, $t0
move $sp, $t0
#ending scope
#begining scope0
#start adding label
r1:
#end adding label
#begining scope0
# adding a number to stack
li $a0, 2
sw $a0, 0($sp)
addiu $sp, $sp, -4
# end of adding a number to stack
# writing int
lw $a0, 4($sp)
# start syscall 1
li $v0, 1
syscall
# end syscall
# pop stack
addiu $sp, $sp, 4
# end of pop stack
addi $a0, $zero, 10
# start syscall 11
li $v0, 11
syscall
# end syscall
# end of writing int
li $t0, 0
add $t0, $fp, $t0
move $sp, $t0
#ending scope
j enda1
li $t0, 0
add $t0, $fp, $t0
move $sp, $t0
#ending scope
li $t0, 0
add $t0, $fp, $t0
move $sp, $t0
#ending scope
# start syscall 10
li $v0, 10
syscall
# end syscall
IndexOutOfBoundError:
#-----------------start writing error message----------
li $a0,'I'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'n'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'d'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'e'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'x'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'O'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'u'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'t'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'O'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'f'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'B'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'u'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'n'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'d'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'E'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'o'
# start syscall 11
li $v0, 11
syscall
# end syscall
li $a0,'r'
# start syscall 11
li $v0, 11
syscall
# end syscall
addi $a0, $zero, 10
# start syscall 11
li $v0, 11
syscall
# end syscall
j, progend
#-----------------end writing error message----------
progend:
li $v0, 10
syscall
