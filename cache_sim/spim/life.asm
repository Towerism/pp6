	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _rndModule.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = seedVal
	  lw $t0, 8($fp)	# fill seedVal to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _rndModule.Random:
	# BeginFunc 40
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp0 = 15625
	  li $t0, 15625		# load constant value 15625 into $t0
	# _tmp1 = *(this + 4)
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t2, 4($t1) 	# load with offset
	# _tmp2 = 10000
	  li $t3, 10000		# load constant value 10000 into $t3
	# _tmp3 = _tmp1 % _tmp2
	  rem $t4, $t2, $t3	
	# _tmp4 = _tmp0 * _tmp3
	  mul $t2, $t0, $t4	
	# _tmp5 = 22221
	  li $t0, 22221		# load constant value 22221 into $t0
	# _tmp6 = _tmp4 + _tmp5
	  add $t3, $t2, $t0	
	# _tmp7 = 65536
	  li $t0, 65536		# load constant value 65536 into $t0
	# _tmp8 = _tmp6 % _tmp7
	  rem $t2, $t3, $t0	
	# *(this + 4) = _tmp8
	  sw $t2, 4($t1) 	# store with offset
	# _tmp9 = *(this + 4)
	  lw $t0, 4($t1) 	# load with offset
	# Return _tmp9
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _rndModule.RndInt:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp10 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 0($t0) 	# load with offset
	# _tmp11 = *(_tmp10 + 4)
	  lw $t2, 4($t1) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp12 = ACall _tmp11
	  sw $t2, -12($fp)	# spill _tmp11 from $t2 to $fp-12
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = _tmp12 % max
	  lw $t1, 8($fp)	# fill max to $t1 from $fp+8
	  rem $t2, $t0, $t1	
	# Return _tmp13
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class rndModule
	  .data
	  .align 2
	  rndModule:		# label for class rndModule vtable
	  .word _rndModule.Init
	  .word _rndModule.Random
	  .word _rndModule.RndInt
	  .text
  _cell.Init:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = state
	  lw $t0, 8($fp)	# fill state to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _cell.GetState:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp14 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# Return _tmp14
	  move $v0, $t1		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _cell.SetState:
	# BeginFunc 0
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = state
	  lw $t0, 8($fp)	# fill state to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class cell
	  .data
	  .align 2
	  cell:		# label for class cell vtable
	  .word _cell.Init
	  .word _cell.GetState
	  .word _cell.SetState
	  .text
  _column.GetY:
	# BeginFunc 48
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp15 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 8($t0) 	# load with offset
	# _tmp16 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp17 = y < _tmp16
	  lw $t2, 8($fp)	# fill y to $t2 from $fp+8
	  slt $t3, $t2, $t0	
	# _tmp18 = *(_tmp15 + -4)
	  lw $t4, -4($t1) 	# load with offset
	# _tmp19 = y < _tmp18
	  slt $t5, $t2, $t4	
	# _tmp20 = _tmp19 == _tmp16
	  seq $t4, $t5, $t0	
	# _tmp21 = _tmp17 || _tmp20
	  or $t0, $t3, $t4	
	# IfZ _tmp21 Goto _L0
	  sw $t0, -32($fp)	# spill _tmp21 from $t0 to $fp-32
	  sw $t1, -8($fp)	# spill _tmp15 from $t1 to $fp-8
	  beqz $t0, _L0	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp23 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp24 = _tmp23 * y
	  lw $t1, 8($fp)	# fill y to $t1 from $fp+8
	  mul $t2, $t0, $t1	
	# _tmp25 = _tmp15 + _tmp24
	  lw $t0, -8($fp)	# fill _tmp15 to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# _tmp26 = *(_tmp25)
	  lw $t0, 0($t1) 	# load with offset
	# Return _tmp26
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _column.SetY:
	# BeginFunc 44
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 44	# decrement sp to make space for locals/temps
	# _tmp27 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 8($t0) 	# load with offset
	# _tmp28 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp29 = y < _tmp28
	  lw $t2, 8($fp)	# fill y to $t2 from $fp+8
	  slt $t3, $t2, $t0	
	# _tmp30 = *(_tmp27 + -4)
	  lw $t4, -4($t1) 	# load with offset
	# _tmp31 = y < _tmp30
	  slt $t5, $t2, $t4	
	# _tmp32 = _tmp31 == _tmp28
	  seq $t4, $t5, $t0	
	# _tmp33 = _tmp29 || _tmp32
	  or $t0, $t3, $t4	
	# IfZ _tmp33 Goto _L1
	  sw $t0, -32($fp)	# spill _tmp33 from $t0 to $fp-32
	  sw $t1, -8($fp)	# spill _tmp27 from $t1 to $fp-8
	  beqz $t0, _L1	# branch if _tmp33 is zero 
	# _tmp34 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp34
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp35 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp36 = _tmp35 * y
	  lw $t1, 8($fp)	# fill y to $t1 from $fp+8
	  mul $t2, $t0, $t1	
	# _tmp37 = _tmp27 + _tmp36
	  lw $t0, -8($fp)	# fill _tmp27 to $t0 from $fp-8
	  add $t1, $t0, $t2	
	# *(_tmp37) = c
	  lw $t0, 12($fp)	# fill c to $t0 from $fp+12
	  sw $t0, 0($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _column.Init:
	# BeginFunc 172
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 172	# decrement sp to make space for locals/temps
	# _tmp38 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp39 = length < _tmp38
	  lw $t1, 8($fp)	# fill length to $t1 from $fp+8
	  slt $t2, $t1, $t0	
	# IfZ _tmp39 Goto _L2
	  sw $t2, -16($fp)	# spill _tmp39 from $t2 to $fp-16
	  beqz $t2, _L2	# branch if _tmp39 is zero 
	# _tmp40 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp41 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp42 = _tmp41 + length
	  lw $t1, 8($fp)	# fill length to $t1 from $fp+8
	  add $t2, $t0, $t1	
	# _tmp43 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp44 = _tmp42 * _tmp43
	  mul $t3, $t2, $t0	
	# PushParam _tmp44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp45 = LCall _Alloc
	  sw $t0, -32($fp)	# spill _tmp43 from $t0 to $fp-32
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp45) = length
	  lw $t1, 8($fp)	# fill length to $t1 from $fp+8
	  sw $t1, 0($t0) 	# store with offset
	# _tmp46 = _tmp45 + _tmp43
	  lw $t2, -32($fp)	# fill _tmp43 to $t2 from $fp-32
	  add $t3, $t0, $t2	
	# *(this + 8) = _tmp46
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t3, 8($t0) 	# store with offset
	# *(this + 4) = length
	  sw $t1, 4($t0) 	# store with offset
	# _tmp47 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# y = _tmp47
	  move $t3, $t2		# copy value to register for y
	  sw $t3, -8($fp)	# spill y from $t3 to $fp-8
  _L3:
	# _tmp48 = y < length
	  lw $t0, -8($fp)	# fill y to $t0 from $fp-8
	  lw $t1, 8($fp)	# fill length to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	# IfZ _tmp48 Goto _L4
	  sw $t2, -52($fp)	# spill _tmp48 from $t2 to $fp-52
	  beqz $t2, _L4	# branch if _tmp48 is zero 
	# _tmp49 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 8($t0) 	# load with offset
	# _tmp50 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp51 = y < _tmp50
	  lw $t3, -8($fp)	# fill y to $t3 from $fp-8
	  slt $t4, $t3, $t2	
	# _tmp52 = *(_tmp49 + -4)
	  lw $t5, -4($t1) 	# load with offset
	# _tmp53 = y < _tmp52
	  slt $t6, $t3, $t5	
	# _tmp54 = _tmp53 == _tmp50
	  seq $t5, $t6, $t2	
	# _tmp55 = _tmp51 || _tmp54
	  or $t2, $t4, $t5	
	# IfZ _tmp55 Goto _L5
	  sw $t1, -56($fp)	# spill _tmp49 from $t1 to $fp-56
	  sw $t2, -80($fp)	# spill _tmp55 from $t2 to $fp-80
	  beqz $t2, _L5	# branch if _tmp55 is zero 
	# _tmp56 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp57 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp58 = _tmp57 * y
	  lw $t1, -8($fp)	# fill y to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp59 = _tmp49 + _tmp58
	  lw $t0, -56($fp)	# fill _tmp49 to $t0 from $fp-56
	  add $t3, $t0, $t2	
	# _tmp60 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp61 = LCall _Alloc
	  sw $t3, -96($fp)	# spill _tmp59 from $t3 to $fp-96
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp62 = cell
	  la $t1, cell	# load label
	# *(_tmp61) = _tmp62
	  sw $t1, 0($t0) 	# store with offset
	# *(_tmp59) = _tmp61
	  lw $t1, -96($fp)	# fill _tmp59 to $t1 from $fp-96
	  sw $t0, 0($t1) 	# store with offset
	# _tmp63 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp64 = *(this + 8)
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t2, 8($t1) 	# load with offset
	# _tmp65 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp66 = y < _tmp65
	  lw $t4, -8($fp)	# fill y to $t4 from $fp-8
	  slt $t5, $t4, $t3	
	# _tmp67 = *(_tmp64 + -4)
	  lw $t6, -4($t2) 	# load with offset
	# _tmp68 = y < _tmp67
	  slt $t9, $t4, $t6	
	  sw $t9, -132($fp)	# spill _tmp68 from $t9 to $fp-132
	# _tmp69 = _tmp68 == _tmp65
	  lw $t6, -132($fp)	# fill _tmp68 to $t6 from $fp-132
	  seq $t9, $t6, $t3	
	  sw $t9, -136($fp)	# spill _tmp69 from $t9 to $fp-136
	# _tmp70 = _tmp66 || _tmp69
	  lw $t3, -136($fp)	# fill _tmp69 to $t3 from $fp-136
	  or $t6, $t5, $t3	
	# IfZ _tmp70 Goto _L6
	  sw $t0, -112($fp)	# spill _tmp63 from $t0 to $fp-112
	  sw $t2, -116($fp)	# spill _tmp64 from $t2 to $fp-116
	  sw $t6, -140($fp)	# spill _tmp70 from $t6 to $fp-140
	  beqz $t6, _L6	# branch if _tmp70 is zero 
	# _tmp71 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp71
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp72 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp73 = _tmp72 * y
	  lw $t1, -8($fp)	# fill y to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp74 = _tmp64 + _tmp73
	  lw $t0, -116($fp)	# fill _tmp64 to $t0 from $fp-116
	  add $t3, $t0, $t2	
	# _tmp75 = *(_tmp74)
	  lw $t0, 0($t3) 	# load with offset
	# _tmp76 = *(_tmp75)
	  lw $t2, 0($t0) 	# load with offset
	# _tmp77 = *(_tmp76)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp63
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, -112($fp)	# fill _tmp63 to $t2 from $fp-112
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp75
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp77
	  sw $t3, -168($fp)	# spill _tmp77 from $t3 to $fp-168
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp78 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp79 = y + _tmp78
	  lw $t1, -8($fp)	# fill y to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# y = _tmp79
	  move $t1, $t2		# copy value to register for y
	# Goto _L3
	  sw $t1, -8($fp)	# spill y from $t1 to $fp-8
	  b _L3		# unconditional branch
  _L4:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class column
	  .data
	  .align 2
	  column:		# label for class column vtable
	  .word _column.GetY
	  .word _column.SetY
	  .word _column.Init
	  .text
  _matrix.Init:
	# BeginFunc 172
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 172	# decrement sp to make space for locals/temps
	# *(this + 8) = y_dim
	  lw $t0, 12($fp)	# fill y_dim to $t0 from $fp+12
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 8($t1) 	# store with offset
	# *(this + 4) = x_dim
	  lw $t2, 8($fp)	# fill x_dim to $t2 from $fp+8
	  sw $t2, 4($t1) 	# store with offset
	# _tmp80 = 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp81 = x_dim < _tmp80
	  slt $t4, $t2, $t3	
	# IfZ _tmp81 Goto _L7
	  sw $t4, -20($fp)	# spill _tmp81 from $t4 to $fp-20
	  beqz $t4, _L7	# branch if _tmp81 is zero 
	# _tmp82 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp82
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp83 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp84 = _tmp83 + x_dim
	  lw $t1, 8($fp)	# fill x_dim to $t1 from $fp+8
	  add $t2, $t0, $t1	
	# _tmp85 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp86 = _tmp84 * _tmp85
	  mul $t3, $t2, $t0	
	# PushParam _tmp86
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp87 = LCall _Alloc
	  sw $t0, -36($fp)	# spill _tmp85 from $t0 to $fp-36
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp87) = x_dim
	  lw $t1, 8($fp)	# fill x_dim to $t1 from $fp+8
	  sw $t1, 0($t0) 	# store with offset
	# _tmp88 = _tmp87 + _tmp85
	  lw $t2, -36($fp)	# fill _tmp85 to $t2 from $fp-36
	  add $t3, $t0, $t2	
	# *(this + 12) = _tmp88
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  sw $t3, 12($t0) 	# store with offset
	# _tmp89 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# x = _tmp89
	  move $t3, $t2		# copy value to register for x
	  sw $t3, -8($fp)	# spill x from $t3 to $fp-8
  _L8:
	# _tmp90 = x < x_dim
	  lw $t0, -8($fp)	# fill x to $t0 from $fp-8
	  lw $t1, 8($fp)	# fill x_dim to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	# IfZ _tmp90 Goto _L9
	  sw $t2, -56($fp)	# spill _tmp90 from $t2 to $fp-56
	  beqz $t2, _L9	# branch if _tmp90 is zero 
	# _tmp91 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 12($t0) 	# load with offset
	# _tmp92 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp93 = x < _tmp92
	  lw $t3, -8($fp)	# fill x to $t3 from $fp-8
	  slt $t4, $t3, $t2	
	# _tmp94 = *(_tmp91 + -4)
	  lw $t5, -4($t1) 	# load with offset
	# _tmp95 = x < _tmp94
	  slt $t6, $t3, $t5	
	# _tmp96 = _tmp95 == _tmp92
	  seq $t5, $t6, $t2	
	# _tmp97 = _tmp93 || _tmp96
	  or $t2, $t4, $t5	
	# IfZ _tmp97 Goto _L10
	  sw $t1, -60($fp)	# spill _tmp91 from $t1 to $fp-60
	  sw $t2, -84($fp)	# spill _tmp97 from $t2 to $fp-84
	  beqz $t2, _L10	# branch if _tmp97 is zero 
	# _tmp98 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp98
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L10:
	# _tmp99 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp100 = _tmp99 * x
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp101 = _tmp91 + _tmp100
	  lw $t0, -60($fp)	# fill _tmp91 to $t0 from $fp-60
	  add $t3, $t0, $t2	
	# _tmp102 = 12
	  li $t0, 12		# load constant value 12 into $t0
	# PushParam _tmp102
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp103 = LCall _Alloc
	  sw $t3, -100($fp)	# spill _tmp101 from $t3 to $fp-100
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp104 = column
	  la $t1, column	# load label
	# *(_tmp103) = _tmp104
	  sw $t1, 0($t0) 	# store with offset
	# *(_tmp101) = _tmp103
	  lw $t1, -100($fp)	# fill _tmp101 to $t1 from $fp-100
	  sw $t0, 0($t1) 	# store with offset
	# _tmp105 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 12($t0) 	# load with offset
	# _tmp106 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp107 = x < _tmp106
	  lw $t3, -8($fp)	# fill x to $t3 from $fp-8
	  slt $t4, $t3, $t2	
	# _tmp108 = *(_tmp105 + -4)
	  lw $t5, -4($t1) 	# load with offset
	# _tmp109 = x < _tmp108
	  slt $t6, $t3, $t5	
	# _tmp110 = _tmp109 == _tmp106
	  seq $t5, $t6, $t2	
	# _tmp111 = _tmp107 || _tmp110
	  or $t2, $t4, $t5	
	# IfZ _tmp111 Goto _L11
	  sw $t1, -116($fp)	# spill _tmp105 from $t1 to $fp-116
	  sw $t2, -140($fp)	# spill _tmp111 from $t2 to $fp-140
	  beqz $t2, _L11	# branch if _tmp111 is zero 
	# _tmp112 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string8	# load label
	# PushParam _tmp112
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp113 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp114 = _tmp113 * x
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp115 = _tmp105 + _tmp114
	  lw $t0, -116($fp)	# fill _tmp105 to $t0 from $fp-116
	  add $t3, $t0, $t2	
	# _tmp116 = *(_tmp115)
	  lw $t0, 0($t3) 	# load with offset
	# _tmp117 = *(_tmp116)
	  lw $t2, 0($t0) 	# load with offset
	# _tmp118 = *(_tmp117 + 8)
	  lw $t3, 8($t2) 	# load with offset
	# PushParam y_dim
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, 12($fp)	# fill y_dim to $t2 from $fp+12
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp118
	  sw $t3, -168($fp)	# spill _tmp118 from $t3 to $fp-168
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp119 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp120 = x + _tmp119
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# x = _tmp120
	  move $t1, $t2		# copy value to register for x
	# Goto _L8
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
	  b _L8		# unconditional branch
  _L9:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _matrix.Set:
	# BeginFunc 124
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 124	# decrement sp to make space for locals/temps
	# _tmp121 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp122 = x < _tmp121
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  slt $t2, $t1, $t0	
	# IfZ _tmp122 Goto _L12
	  sw $t2, -20($fp)	# spill _tmp122 from $t2 to $fp-20
	  beqz $t2, _L12	# branch if _tmp122 is zero 
	# Return 
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L12:
	# _tmp123 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp124 = _tmp123 < x
	  lw $t2, 8($fp)	# fill x to $t2 from $fp+8
	  slt $t3, $t1, $t2	
	# _tmp125 = _tmp123 == x
	  seq $t4, $t1, $t2	
	# _tmp126 = _tmp124 || _tmp125
	  or $t1, $t3, $t4	
	# IfZ _tmp126 Goto _L13
	  sw $t1, -36($fp)	# spill _tmp126 from $t1 to $fp-36
	  beqz $t1, _L13	# branch if _tmp126 is zero 
	# Return 
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L13:
	# _tmp127 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp128 = y < _tmp127
	  lw $t1, 12($fp)	# fill y to $t1 from $fp+12
	  slt $t2, $t1, $t0	
	# IfZ _tmp128 Goto _L14
	  sw $t2, -44($fp)	# spill _tmp128 from $t2 to $fp-44
	  beqz $t2, _L14	# branch if _tmp128 is zero 
	# Return 
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L14:
	# _tmp129 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 8($t0) 	# load with offset
	# _tmp130 = _tmp129 < y
	  lw $t2, 12($fp)	# fill y to $t2 from $fp+12
	  slt $t3, $t1, $t2	
	# _tmp131 = _tmp129 == y
	  seq $t4, $t1, $t2	
	# _tmp132 = _tmp130 || _tmp131
	  or $t1, $t3, $t4	
	# IfZ _tmp132 Goto _L15
	  sw $t1, -60($fp)	# spill _tmp132 from $t1 to $fp-60
	  beqz $t1, _L15	# branch if _tmp132 is zero 
	# Return 
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L15:
	# _tmp133 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 12($t0) 	# load with offset
	# _tmp134 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp135 = x < _tmp134
	  lw $t2, 8($fp)	# fill x to $t2 from $fp+8
	  slt $t3, $t2, $t0	
	# _tmp136 = *(_tmp133 + -4)
	  lw $t4, -4($t1) 	# load with offset
	# _tmp137 = x < _tmp136
	  slt $t5, $t2, $t4	
	# _tmp138 = _tmp137 == _tmp134
	  seq $t4, $t5, $t0	
	# _tmp139 = _tmp135 || _tmp138
	  or $t0, $t3, $t4	
	# IfZ _tmp139 Goto _L16
	  sw $t0, -88($fp)	# spill _tmp139 from $t0 to $fp-88
	  sw $t1, -64($fp)	# spill _tmp133 from $t1 to $fp-64
	  beqz $t0, _L16	# branch if _tmp139 is zero 
	# _tmp140 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp140
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L16:
	# _tmp141 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp142 = _tmp141 * x
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  mul $t2, $t0, $t1	
	# _tmp143 = _tmp133 + _tmp142
	  lw $t0, -64($fp)	# fill _tmp133 to $t0 from $fp-64
	  add $t1, $t0, $t2	
	# _tmp144 = *(_tmp143)
	  lw $t0, 0($t1) 	# load with offset
	# mcol = _tmp144
	  move $t1, $t0		# copy value to register for mcol
	# _tmp145 = *(mcol)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp146 = *(_tmp145)
	  lw $t2, 0($t0) 	# load with offset
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam mcol
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp147 = ACall _tmp146
	  sw $t2, -116($fp)	# spill _tmp146 from $t2 to $fp-116
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# mcell = _tmp147
	  move $t1, $t0		# copy value to register for mcell
	# _tmp148 = *(mcell)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp149 = *(_tmp148 + 8)
	  lw $t2, 8($t0) 	# load with offset
	# PushParam state
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 16($fp)	# fill state to $t0 from $fp+16
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam mcell
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp149
	  sw $t2, -128($fp)	# spill _tmp149 from $t2 to $fp-128
	  jalr $t2            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _matrix.Get:
	# BeginFunc 144
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 144	# decrement sp to make space for locals/temps
	# _tmp150 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp151 = x < _tmp150
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  slt $t2, $t1, $t0	
	# IfZ _tmp151 Goto _L17
	  sw $t2, -20($fp)	# spill _tmp151 from $t2 to $fp-20
	  beqz $t2, _L17	# branch if _tmp151 is zero 
	# _tmp152 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp152
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L17:
	# _tmp153 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp154 = _tmp153 < x
	  lw $t2, 8($fp)	# fill x to $t2 from $fp+8
	  slt $t3, $t1, $t2	
	# _tmp155 = _tmp153 == x
	  seq $t4, $t1, $t2	
	# _tmp156 = _tmp154 || _tmp155
	  or $t1, $t3, $t4	
	# IfZ _tmp156 Goto _L18
	  sw $t1, -40($fp)	# spill _tmp156 from $t1 to $fp-40
	  beqz $t1, _L18	# branch if _tmp156 is zero 
	# _tmp157 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp157
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L18:
	# _tmp158 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp159 = y < _tmp158
	  lw $t1, 12($fp)	# fill y to $t1 from $fp+12
	  slt $t2, $t1, $t0	
	# IfZ _tmp159 Goto _L19
	  sw $t2, -52($fp)	# spill _tmp159 from $t2 to $fp-52
	  beqz $t2, _L19	# branch if _tmp159 is zero 
	# _tmp160 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp160
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L19:
	# _tmp161 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 8($t0) 	# load with offset
	# _tmp162 = _tmp161 < y
	  lw $t2, 12($fp)	# fill y to $t2 from $fp+12
	  slt $t3, $t1, $t2	
	# _tmp163 = _tmp161 == y
	  seq $t4, $t1, $t2	
	# _tmp164 = _tmp162 || _tmp163
	  or $t1, $t3, $t4	
	# IfZ _tmp164 Goto _L20
	  sw $t1, -72($fp)	# spill _tmp164 from $t1 to $fp-72
	  beqz $t1, _L20	# branch if _tmp164 is zero 
	# _tmp165 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp165
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L20:
	# _tmp166 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 12($t0) 	# load with offset
	# _tmp167 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp168 = x < _tmp167
	  lw $t2, 8($fp)	# fill x to $t2 from $fp+8
	  slt $t3, $t2, $t0	
	# _tmp169 = *(_tmp166 + -4)
	  lw $t4, -4($t1) 	# load with offset
	# _tmp170 = x < _tmp169
	  slt $t5, $t2, $t4	
	# _tmp171 = _tmp170 == _tmp167
	  seq $t4, $t5, $t0	
	# _tmp172 = _tmp168 || _tmp171
	  or $t0, $t3, $t4	
	# IfZ _tmp172 Goto _L21
	  sw $t0, -104($fp)	# spill _tmp172 from $t0 to $fp-104
	  sw $t1, -80($fp)	# spill _tmp166 from $t1 to $fp-80
	  beqz $t0, _L21	# branch if _tmp172 is zero 
	# _tmp173 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string10	# load label
	# PushParam _tmp173
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L21:
	# _tmp174 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp175 = _tmp174 * x
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  mul $t2, $t0, $t1	
	# _tmp176 = _tmp166 + _tmp175
	  lw $t0, -80($fp)	# fill _tmp166 to $t0 from $fp-80
	  add $t1, $t0, $t2	
	# _tmp177 = *(_tmp176)
	  lw $t0, 0($t1) 	# load with offset
	# mcol = _tmp177
	  move $t1, $t0		# copy value to register for mcol
	# _tmp178 = *(mcol)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp179 = *(_tmp178)
	  lw $t2, 0($t0) 	# load with offset
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam mcol
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp180 = ACall _tmp179
	  sw $t2, -132($fp)	# spill _tmp179 from $t2 to $fp-132
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# mcell = _tmp180
	  move $t1, $t0		# copy value to register for mcell
	# _tmp181 = *(mcell)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp182 = *(_tmp181 + 4)
	  lw $t2, 4($t0) 	# load with offset
	# PushParam mcell
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp183 = ACall _tmp182
	  sw $t2, -144($fp)	# spill _tmp182 from $t2 to $fp-144
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Return _tmp183
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class matrix
	  .data
	  .align 2
	  matrix:		# label for class matrix vtable
	  .word _matrix.Init
	  .word _matrix.Set
	  .word _matrix.Get
	  .text
  _life.Init:
	# BeginFunc 140
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 140	# decrement sp to make space for locals/temps
	# _tmp184 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# x = _tmp184
	  move $t1, $t0		# copy value to register for x
	# _tmp185 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# y = _tmp185
	  move $t1, $t0		# copy value to register for y
	# *(this + 20) = x_dim
	  lw $t0, 8($fp)	# fill x_dim to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 20($t1) 	# store with offset
	# *(this + 24) = y_dim
	  lw $t2, 12($fp)	# fill y_dim to $t2 from $fp+12
	  sw $t2, 24($t1) 	# store with offset
	# _tmp186 = 16
	  li $t3, 16		# load constant value 16 into $t3
	# PushParam _tmp186
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp187 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp188 = matrix
	  la $t1, matrix	# load label
	# *(_tmp187) = _tmp188
	  sw $t1, 0($t0) 	# store with offset
	# *(this + 8) = _tmp187
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 8($t1) 	# store with offset
	# _tmp189 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# PushParam _tmp189
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp190 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp191 = matrix
	  la $t1, matrix	# load label
	# *(_tmp190) = _tmp191
	  sw $t1, 0($t0) 	# store with offset
	# *(this + 12) = _tmp190
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 12($t1) 	# store with offset
	# _tmp192 = *(this + 8)
	  lw $t0, 8($t1) 	# load with offset
	# *(this + 4) = _tmp192
	  sw $t0, 4($t1) 	# store with offset
	# _tmp193 = *(this + 8)
	  lw $t0, 8($t1) 	# load with offset
	# _tmp194 = *(_tmp193)
	  lw $t2, 0($t0) 	# load with offset
	# _tmp195 = *(_tmp194)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam y_dim
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, 12($fp)	# fill y_dim to $t2 from $fp+12
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam x_dim
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, 8($fp)	# fill x_dim to $t4 from $fp+8
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam _tmp193
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp195
	  sw $t3, -60($fp)	# spill _tmp195 from $t3 to $fp-60
	  jalr $t3            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp196 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 12($t0) 	# load with offset
	# _tmp197 = *(_tmp196)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp198 = *(_tmp197)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam y_dim
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, 12($fp)	# fill y_dim to $t2 from $fp+12
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam x_dim
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, 8($fp)	# fill x_dim to $t2 from $fp+8
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp196
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp198
	  sw $t3, -72($fp)	# spill _tmp198 from $t3 to $fp-72
	  jalr $t3            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp199 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# y = _tmp199
	  move $t1, $t0		# copy value to register for y
	  sw $t1, -12($fp)	# spill y from $t1 to $fp-12
  _L22:
	# _tmp200 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 24($t0) 	# load with offset
	# _tmp201 = y < _tmp200
	  lw $t2, -12($fp)	# fill y to $t2 from $fp-12
	  slt $t3, $t2, $t1	
	# IfZ _tmp201 Goto _L23
	  sw $t3, -84($fp)	# spill _tmp201 from $t3 to $fp-84
	  beqz $t3, _L23	# branch if _tmp201 is zero 
	# _tmp202 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# x = _tmp202
	  move $t1, $t0		# copy value to register for x
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
  _L24:
	# _tmp203 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 20($t0) 	# load with offset
	# _tmp204 = x < _tmp203
	  lw $t2, -8($fp)	# fill x to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp204 Goto _L25
	  sw $t3, -96($fp)	# spill _tmp204 from $t3 to $fp-96
	  beqz $t3, _L25	# branch if _tmp204 is zero 
	# _tmp205 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp206 = *(this + 8)
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t2, 8($t1) 	# load with offset
	# _tmp207 = *(_tmp206)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp208 = *(_tmp207 + 4)
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp205
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill y to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill x to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp206
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp208
	  sw $t4, -112($fp)	# spill _tmp208 from $t4 to $fp-112
	  jalr $t4            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp209 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp210 = *(this + 12)
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t2, 12($t1) 	# load with offset
	# _tmp211 = *(_tmp210)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp212 = *(_tmp211 + 4)
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp209
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill y to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -8($fp)	# fill x to $t3 from $fp-8
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp210
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp212
	  sw $t4, -128($fp)	# spill _tmp212 from $t4 to $fp-128
	  jalr $t4            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp213 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp214 = x + _tmp213
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# x = _tmp214
	  move $t1, $t2		# copy value to register for x
	# Goto _L24
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
	  b _L24		# unconditional branch
  _L25:
	# _tmp215 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp216 = y + _tmp215
	  lw $t1, -12($fp)	# fill y to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# y = _tmp216
	  move $t1, $t2		# copy value to register for y
	# Goto _L22
	  sw $t1, -12($fp)	# spill y from $t1 to $fp-12
	  b _L22		# unconditional branch
  _L23:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _life.SetInit:
	# BeginFunc 80
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp217 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp218 = x < _tmp217
	  lw $t1, 8($fp)	# fill x to $t1 from $fp+8
	  slt $t2, $t1, $t0	
	# IfZ _tmp218 Goto _L26
	  sw $t2, -12($fp)	# spill _tmp218 from $t2 to $fp-12
	  beqz $t2, _L26	# branch if _tmp218 is zero 
	# _tmp219 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp219
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L26:
	# _tmp220 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp221 = y < _tmp220
	  lw $t1, 12($fp)	# fill y to $t1 from $fp+12
	  slt $t2, $t1, $t0	
	# IfZ _tmp221 Goto _L27
	  sw $t2, -24($fp)	# spill _tmp221 from $t2 to $fp-24
	  beqz $t2, _L27	# branch if _tmp221 is zero 
	# _tmp222 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp222
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L27:
	# _tmp223 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 20($t0) 	# load with offset
	# _tmp224 = _tmp223 < x
	  lw $t2, 8($fp)	# fill x to $t2 from $fp+8
	  slt $t3, $t1, $t2	
	# _tmp225 = _tmp223 == x
	  seq $t4, $t1, $t2	
	# _tmp226 = _tmp224 || _tmp225
	  or $t1, $t3, $t4	
	# IfZ _tmp226 Goto _L28
	  sw $t1, -44($fp)	# spill _tmp226 from $t1 to $fp-44
	  beqz $t1, _L28	# branch if _tmp226 is zero 
	# _tmp227 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp227
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L28:
	# _tmp228 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 24($t0) 	# load with offset
	# _tmp229 = _tmp228 < y
	  lw $t2, 12($fp)	# fill y to $t2 from $fp+12
	  slt $t3, $t1, $t2	
	# _tmp230 = _tmp228 == y
	  seq $t4, $t1, $t2	
	# _tmp231 = _tmp229 || _tmp230
	  or $t1, $t3, $t4	
	# IfZ _tmp231 Goto _L29
	  sw $t1, -64($fp)	# spill _tmp231 from $t1 to $fp-64
	  beqz $t1, _L29	# branch if _tmp231 is zero 
	# _tmp232 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp232
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L29:
	# _tmp233 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp234 = *(_tmp233)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp235 = *(_tmp234 + 4)
	  lw $t2, 4($t0) 	# load with offset
	# PushParam state
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 16($fp)	# fill state to $t0 from $fp+16
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp233
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp235
	  sw $t2, -80($fp)	# spill _tmp235 from $t2 to $fp-80
	  jalr $t2            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp236 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# Return _tmp236
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _life.PrintMatrix:
	# BeginFunc 104
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 104	# decrement sp to make space for locals/temps
	# _tmp237 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# y = _tmp237
	  move $t1, $t0		# copy value to register for y
	  sw $t1, -12($fp)	# spill y from $t1 to $fp-12
  _L30:
	# _tmp238 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 24($t0) 	# load with offset
	# _tmp239 = y < _tmp238
	  lw $t2, -12($fp)	# fill y to $t2 from $fp-12
	  slt $t3, $t2, $t1	
	# IfZ _tmp239 Goto _L31
	  sw $t3, -28($fp)	# spill _tmp239 from $t3 to $fp-28
	  beqz $t3, _L31	# branch if _tmp239 is zero 
	# _tmp240 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# x = _tmp240
	  move $t1, $t0		# copy value to register for x
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
  _L32:
	# _tmp241 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 20($t0) 	# load with offset
	# _tmp242 = x < _tmp241
	  lw $t2, -8($fp)	# fill x to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp242 Goto _L33
	  sw $t3, -40($fp)	# spill _tmp242 from $t3 to $fp-40
	  beqz $t3, _L33	# branch if _tmp242 is zero 
	# _tmp243 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp244 = *(_tmp243)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp245 = *(_tmp244 + 8)
	  lw $t3, 8($t2) 	# load with offset
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, -12($fp)	# fill y to $t2 from $fp-12
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t4, -8($fp)	# fill x to $t4 from $fp-8
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam _tmp243
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp246 = ACall _tmp245
	  sw $t3, -52($fp)	# spill _tmp245 from $t3 to $fp-52
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# IfZ _tmp246 Goto _L34
	  sw $t0, -56($fp)	# spill _tmp246 from $t0 to $fp-56
	  beqz $t0, _L34	# branch if _tmp246 is zero 
	# _tmp247 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# s = _tmp247
	  move $t1, $t0		# copy value to register for s
	# Goto _L35
	  sw $t1, -16($fp)	# spill s from $t1 to $fp-16
	  b _L35		# unconditional branch
  _L34:
	# _tmp248 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# s = _tmp248
	  move $t1, $t0		# copy value to register for s
	  sw $t1, -16($fp)	# spill s from $t1 to $fp-16
  _L35:
	# _tmp249 = "| "
	  .data			# create string constant marked with label
	  _string11: .asciiz "| "
	  .text
	  la $t0, _string11	# load label
	# PushParam _tmp249
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam s
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -16($fp)	# fill s to $t0 from $fp-16
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp250 = " "
	  .data			# create string constant marked with label
	  _string12: .asciiz " "
	  .text
	  la $t0, _string12	# load label
	# PushParam _tmp250
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp251 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 20($t0) 	# load with offset
	# _tmp252 = 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp253 = _tmp251 - _tmp252
	  sub $t3, $t1, $t2	
	# _tmp254 = x == _tmp253
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  seq $t2, $t1, $t3	
	# IfZ _tmp254 Goto _L36
	  sw $t2, -88($fp)	# spill _tmp254 from $t2 to $fp-88
	  beqz $t2, _L36	# branch if _tmp254 is zero 
	# _tmp255 = "|\n"
	  .data			# create string constant marked with label
	  _string13: .asciiz "|\n"
	  .text
	  la $t0, _string13	# load label
	# PushParam _tmp255
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L36:
	# _tmp256 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp257 = x + _tmp256
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# x = _tmp257
	  move $t1, $t2		# copy value to register for x
	# Goto _L32
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
	  b _L32		# unconditional branch
  _L33:
	# _tmp258 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp259 = y + _tmp258
	  lw $t1, -12($fp)	# fill y to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# y = _tmp259
	  move $t1, $t2		# copy value to register for y
	# Goto _L30
	  sw $t1, -12($fp)	# spill y from $t1 to $fp-12
	  b _L30		# unconditional branch
  _L31:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _life.DoLife:
	# BeginFunc 292
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 292	# decrement sp to make space for locals/temps
	# _tmp260 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 4($t0) 	# load with offset
	# _tmp261 = *(this + 8)
	  lw $t2, 8($t0) 	# load with offset
	# _tmp262 = _tmp260 == _tmp261
	  seq $t3, $t1, $t2	
	# IfZ _tmp262 Goto _L37
	  sw $t3, -36($fp)	# spill _tmp262 from $t3 to $fp-36
	  beqz $t3, _L37	# branch if _tmp262 is zero 
	# _tmp263 = *(this + 12)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 12($t0) 	# load with offset
	# n = _tmp263
	  move $t2, $t1		# copy value to register for n
	# Goto _L38
	  sw $t2, -24($fp)	# spill n from $t2 to $fp-24
	  b _L38		# unconditional branch
  _L37:
	# _tmp264 = *(this + 8)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 8($t0) 	# load with offset
	# n = _tmp264
	  move $t2, $t1		# copy value to register for n
	  sw $t2, -24($fp)	# spill n from $t2 to $fp-24
  _L38:
	# _tmp265 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# y = _tmp265
	  move $t1, $t0		# copy value to register for y
	  sw $t1, -12($fp)	# spill y from $t1 to $fp-12
  _L39:
	# _tmp266 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 24($t0) 	# load with offset
	# _tmp267 = y < _tmp266
	  lw $t2, -12($fp)	# fill y to $t2 from $fp-12
	  slt $t3, $t2, $t1	
	# IfZ _tmp267 Goto _L40
	  sw $t3, -56($fp)	# spill _tmp267 from $t3 to $fp-56
	  beqz $t3, _L40	# branch if _tmp267 is zero 
	# _tmp268 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# x = _tmp268
	  move $t1, $t0		# copy value to register for x
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
  _L41:
	# _tmp269 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 20($t0) 	# load with offset
	# _tmp270 = x < _tmp269
	  lw $t2, -8($fp)	# fill x to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp270 Goto _L42
	  sw $t3, -68($fp)	# spill _tmp270 from $t3 to $fp-68
	  beqz $t3, _L42	# branch if _tmp270 is zero 
	# _tmp271 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# neigh_count = _tmp271
	  move $t1, $t0		# copy value to register for neigh_count
	# _tmp272 = *(this + 4)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 4($t0) 	# load with offset
	# _tmp273 = *(_tmp272)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp274 = *(_tmp273 + 8)
	  lw $t4, 8($t3) 	# load with offset
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t3, -12($fp)	# fill y to $t3 from $fp-12
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t5, -8($fp)	# fill x to $t5 from $fp-8
	  sw $t5, 4($sp)	# copy param value to stack
	# PushParam _tmp272
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp275 = ACall _tmp274
	  sw $t1, -72($fp)	# spill neigh_count from $t1 to $fp-72
	  sw $t4, -92($fp)	# spill _tmp274 from $t4 to $fp-92
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# my_state = _tmp275
	  move $t1, $t0		# copy value to register for my_state
	# _tmp276 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp277 = y - _tmp276
	  lw $t2, -12($fp)	# fill y to $t2 from $fp-12
	  sub $t3, $t2, $t0	
	# j = _tmp277
	  move $t0, $t3		# copy value to register for j
	  sw $t0, -20($fp)	# spill j from $t0 to $fp-20
	  sw $t1, -76($fp)	# spill my_state from $t1 to $fp-76
  _L43:
	# _tmp278 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp279 = y + _tmp278
	  lw $t1, -12($fp)	# fill y to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# _tmp280 = j < _tmp279
	  lw $t0, -20($fp)	# fill j to $t0 from $fp-20
	  slt $t3, $t0, $t2	
	# IfZ _tmp280 Goto _L44
	  sw $t3, -116($fp)	# spill _tmp280 from $t3 to $fp-116
	  beqz $t3, _L44	# branch if _tmp280 is zero 
	# _tmp281 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp282 = x - _tmp281
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  sub $t2, $t1, $t0	
	# i = _tmp282
	  move $t0, $t2		# copy value to register for i
	  sw $t0, -16($fp)	# spill i from $t0 to $fp-16
  _L45:
	# _tmp283 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp284 = x + _tmp283
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# _tmp285 = i < _tmp284
	  lw $t0, -16($fp)	# fill i to $t0 from $fp-16
	  slt $t3, $t0, $t2	
	# IfZ _tmp285 Goto _L46
	  sw $t3, -136($fp)	# spill _tmp285 from $t3 to $fp-136
	  beqz $t3, _L46	# branch if _tmp285 is zero 
	# _tmp286 = x == i
	  lw $t0, -8($fp)	# fill x to $t0 from $fp-8
	  lw $t1, -16($fp)	# fill i to $t1 from $fp-16
	  seq $t2, $t0, $t1	
	# _tmp287 = y == j
	  lw $t3, -12($fp)	# fill y to $t3 from $fp-12
	  lw $t4, -20($fp)	# fill j to $t4 from $fp-20
	  seq $t5, $t3, $t4	
	# _tmp288 = _tmp286 && _tmp287
	  and $t6, $t2, $t5	
	# skip = _tmp288
	  move $t2, $t6		# copy value to register for skip
	# _tmp289 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp290 = skip == _tmp289
	  seq $t6, $t2, $t5	
	# _tmp291 = *(this + 4)
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  lw $t5, 4($t2) 	# load with offset
	# _tmp292 = *(_tmp291)
	  lw $t9, 0($t5) 	# load with offset
	  sw $t9, -168($fp)	# spill _tmp292 from $t9 to $fp-168
	# _tmp293 = *(_tmp292 + 8)
	  lw $t7, -168($fp)	# fill _tmp292 to $t7 from $fp-168
	  lw $t9, 8($t7) 	# load with offset
	  sw $t9, -172($fp)	# spill _tmp293 from $t9 to $fp-172
	# PushParam j
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp291
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# _tmp294 = ACall _tmp293
	  lw $t5, -172($fp)	# fill _tmp293 to $t5 from $fp-172
	  sw $t6, -160($fp)	# spill _tmp290 from $t6 to $fp-160
	  jalr $t5            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp295 = _tmp290 && _tmp294
	  lw $t1, -160($fp)	# fill _tmp290 to $t1 from $fp-160
	  and $t2, $t1, $t0	
	# IfZ _tmp295 Goto _L47
	  sw $t2, -180($fp)	# spill _tmp295 from $t2 to $fp-180
	  beqz $t2, _L47	# branch if _tmp295 is zero 
	# _tmp296 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp297 = neigh_count + _tmp296
	  lw $t1, -72($fp)	# fill neigh_count to $t1 from $fp-72
	  add $t2, $t1, $t0	
	# neigh_count = _tmp297
	  move $t1, $t2		# copy value to register for neigh_count
	  sw $t1, -72($fp)	# spill neigh_count from $t1 to $fp-72
  _L47:
	# _tmp298 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp299 = i + _tmp298
	  lw $t1, -16($fp)	# fill i to $t1 from $fp-16
	  add $t2, $t1, $t0	
	# i = _tmp299
	  move $t1, $t2		# copy value to register for i
	# Goto _L45
	  sw $t1, -16($fp)	# spill i from $t1 to $fp-16
	  b _L45		# unconditional branch
  _L46:
	# _tmp300 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp301 = j + _tmp300
	  lw $t1, -20($fp)	# fill j to $t1 from $fp-20
	  add $t2, $t1, $t0	
	# j = _tmp301
	  move $t1, $t2		# copy value to register for j
	# Goto _L43
	  sw $t1, -20($fp)	# spill j from $t1 to $fp-20
	  b _L43		# unconditional branch
  _L44:
	# IfZ my_state Goto _L48
	  lw $t0, -76($fp)	# fill my_state to $t0 from $fp-76
	  beqz $t0, _L48	# branch if my_state is zero 
	# _tmp302 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp303 = neigh_count == _tmp302
	  lw $t1, -72($fp)	# fill neigh_count to $t1 from $fp-72
	  seq $t2, $t1, $t0	
	# _tmp304 = 3
	  li $t0, 3		# load constant value 3 into $t0
	# _tmp305 = neigh_count == _tmp304
	  seq $t3, $t1, $t0	
	# _tmp306 = _tmp303 || _tmp305
	  or $t0, $t2, $t3	
	# IfZ _tmp306 Goto _L49
	  sw $t0, -224($fp)	# spill _tmp306 from $t0 to $fp-224
	  beqz $t0, _L49	# branch if _tmp306 is zero 
	# _tmp307 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp308 = *(n)
	  lw $t1, -24($fp)	# fill n to $t1 from $fp-24
	  lw $t2, 0($t1) 	# load with offset
	# _tmp309 = *(_tmp308 + 4)
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp307
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill y to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, -8($fp)	# fill x to $t2 from $fp-8
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp309
	  sw $t3, -236($fp)	# spill _tmp309 from $t3 to $fp-236
	  jalr $t3            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# Goto _L50
	  b _L50		# unconditional branch
  _L49:
	# _tmp310 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp311 = *(n)
	  lw $t1, -24($fp)	# fill n to $t1 from $fp-24
	  lw $t2, 0($t1) 	# load with offset
	# _tmp312 = *(_tmp311 + 4)
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp310
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill y to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, -8($fp)	# fill x to $t2 from $fp-8
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp312
	  sw $t3, -248($fp)	# spill _tmp312 from $t3 to $fp-248
	  jalr $t3            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
  _L50:
	# Goto _L51
	  b _L51		# unconditional branch
  _L48:
	# _tmp313 = 3
	  li $t0, 3		# load constant value 3 into $t0
	# _tmp314 = neigh_count == _tmp313
	  lw $t1, -72($fp)	# fill neigh_count to $t1 from $fp-72
	  seq $t2, $t1, $t0	
	# IfZ _tmp314 Goto _L52
	  sw $t2, -256($fp)	# spill _tmp314 from $t2 to $fp-256
	  beqz $t2, _L52	# branch if _tmp314 is zero 
	# _tmp315 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp316 = *(n)
	  lw $t1, -24($fp)	# fill n to $t1 from $fp-24
	  lw $t2, 0($t1) 	# load with offset
	# _tmp317 = *(_tmp316 + 4)
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp315
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill y to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, -8($fp)	# fill x to $t2 from $fp-8
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp317
	  sw $t3, -268($fp)	# spill _tmp317 from $t3 to $fp-268
	  jalr $t3            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# Goto _L53
	  b _L53		# unconditional branch
  _L52:
	# _tmp318 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp319 = *(n)
	  lw $t1, -24($fp)	# fill n to $t1 from $fp-24
	  lw $t2, 0($t1) 	# load with offset
	# _tmp320 = *(_tmp319 + 4)
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp318
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill y to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, -8($fp)	# fill x to $t2 from $fp-8
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam n
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp320
	  sw $t3, -280($fp)	# spill _tmp320 from $t3 to $fp-280
	  jalr $t3            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
  _L53:
  _L51:
	# _tmp321 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp322 = x + _tmp321
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# x = _tmp322
	  move $t1, $t2		# copy value to register for x
	# Goto _L41
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
	  b _L41		# unconditional branch
  _L42:
	# _tmp323 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp324 = y + _tmp323
	  lw $t1, -12($fp)	# fill y to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# y = _tmp324
	  move $t1, $t2		# copy value to register for y
	# Goto _L39
	  sw $t1, -12($fp)	# spill y from $t1 to $fp-12
	  b _L39		# unconditional branch
  _L40:
	# *(this + 4) = n
	  lw $t0, -24($fp)	# fill n to $t0 from $fp-24
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _life.runLife:
	# BeginFunc 72
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 72	# decrement sp to make space for locals/temps
	# _tmp325 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp325
	  move $t1, $t0		# copy value to register for i
	# _tmp326 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp327 = gen < _tmp326
	  lw $t2, 8($fp)	# fill gen to $t2 from $fp+8
	  slt $t3, $t2, $t0	
	# IfZ _tmp327 Goto _L54
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  sw $t3, -24($fp)	# spill _tmp327 from $t3 to $fp-24
	  beqz $t3, _L54	# branch if _tmp327 is zero 
	# _tmp328 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# iter = _tmp328
	  move $t1, $t0		# copy value to register for iter
	# Goto _L55
	  sw $t1, -12($fp)	# spill iter from $t1 to $fp-12
	  b _L55		# unconditional branch
  _L54:
	# iter = gen
	  lw $t0, 8($fp)	# fill gen to $t0 from $fp+8
	  move $t1, $t0		# copy value to register for iter
	  sw $t1, -12($fp)	# spill iter from $t1 to $fp-12
  _L55:
	# _tmp329 = "Initial generation\n"
	  .data			# create string constant marked with label
	  _string14: .asciiz "Initial generation\n"
	  .text
	  la $t0, _string14	# load label
	# PushParam _tmp329
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp330 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 0($t0) 	# load with offset
	# _tmp331 = *(_tmp330 + 8)
	  lw $t2, 8($t1) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp331
	  sw $t2, -40($fp)	# spill _tmp331 from $t2 to $fp-40
	  jalr $t2            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L56:
	# _tmp332 = i < iter
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  lw $t1, -12($fp)	# fill iter to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	# IfZ _tmp332 Goto _L57
	  sw $t2, -44($fp)	# spill _tmp332 from $t2 to $fp-44
	  beqz $t2, _L57	# branch if _tmp332 is zero 
	# _tmp333 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 0($t0) 	# load with offset
	# _tmp334 = *(_tmp333 + 12)
	  lw $t2, 12($t1) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp334
	  sw $t2, -52($fp)	# spill _tmp334 from $t2 to $fp-52
	  jalr $t2            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp335 = "New generation = "
	  .data			# create string constant marked with label
	  _string15: .asciiz "New generation = "
	  .text
	  la $t0, _string15	# load label
	# PushParam _tmp335
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam i
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill i to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp336 = "\n"
	  .data			# create string constant marked with label
	  _string16: .asciiz "\n"
	  .text
	  la $t0, _string16	# load label
	# PushParam _tmp336
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp337 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 0($t0) 	# load with offset
	# _tmp338 = *(_tmp337 + 8)
	  lw $t2, 8($t1) 	# load with offset
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp338
	  sw $t2, -68($fp)	# spill _tmp338 from $t2 to $fp-68
	  jalr $t2            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp339 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp340 = i + _tmp339
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# i = _tmp340
	  move $t1, $t2		# copy value to register for i
	# Goto _L56
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  b _L56		# unconditional branch
  _L57:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _life.playLife:
	# BeginFunc 484
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 484	# decrement sp to make space for locals/temps
	# _tmp341 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# x = _tmp341
	  move $t1, $t0		# copy value to register for x
	# _tmp342 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# y = _tmp342
	  move $t2, $t0		# copy value to register for y
	# _tmp343 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# gen = _tmp343
	  move $t3, $t0		# copy value to register for gen
	# _tmp344 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# use_rand = _tmp344
	  move $t3, $t0		# copy value to register for use_rand
	# _tmp345 = "The Game of Life using (Brown Univ) CS31 Rules\n"
	  .data			# create string constant marked with label
	  _string17: .asciiz "The Game of Life using (Brown Univ) CS31 Rules\n"
	  .text
	  la $t0, _string17	# load label
	# PushParam _tmp345
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
	  sw $t2, -12($fp)	# spill y from $t2 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp346 = "Enter X dimension for game board\n"
	  .data			# create string constant marked with label
	  _string18: .asciiz "Enter X dimension for game board\n"
	  .text
	  la $t0, _string18	# load label
	# PushParam _tmp346
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L58:
	# _tmp347 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp348 = x < _tmp347
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# _tmp349 = x == _tmp347
	  seq $t3, $t1, $t0	
	# _tmp350 = _tmp348 || _tmp349
	  or $t0, $t2, $t3	
	# IfZ _tmp350 Goto _L59
	  sw $t0, -60($fp)	# spill _tmp350 from $t0 to $fp-60
	  beqz $t0, _L59	# branch if _tmp350 is zero 
	# _tmp351 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# x = _tmp351
	  move $t1, $t0		# copy value to register for x
	# _tmp352 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp353 = x < _tmp352
	  slt $t2, $t1, $t0	
	# _tmp354 = x == _tmp352
	  seq $t3, $t1, $t0	
	# _tmp355 = _tmp353 || _tmp354
	  or $t0, $t2, $t3	
	# IfZ _tmp355 Goto _L60
	  sw $t0, -80($fp)	# spill _tmp355 from $t0 to $fp-80
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
	  beqz $t0, _L60	# branch if _tmp355 is zero 
	# _tmp356 = "Invalid x dimension, try again\n"
	  .data			# create string constant marked with label
	  _string19: .asciiz "Invalid x dimension, try again\n"
	  .text
	  la $t0, _string19	# load label
	# PushParam _tmp356
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L60:
	# Goto _L58
	  b _L58		# unconditional branch
  _L59:
	# _tmp357 = "Enter Y dimension for game board\n"
	  .data			# create string constant marked with label
	  _string20: .asciiz "Enter Y dimension for game board\n"
	  .text
	  la $t0, _string20	# load label
	# PushParam _tmp357
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L61:
	# _tmp358 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp359 = y < _tmp358
	  lw $t1, -12($fp)	# fill y to $t1 from $fp-12
	  slt $t2, $t1, $t0	
	# _tmp360 = y == _tmp358
	  seq $t3, $t1, $t0	
	# _tmp361 = _tmp359 || _tmp360
	  or $t0, $t2, $t3	
	# IfZ _tmp361 Goto _L62
	  sw $t0, -104($fp)	# spill _tmp361 from $t0 to $fp-104
	  beqz $t0, _L62	# branch if _tmp361 is zero 
	# _tmp362 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# y = _tmp362
	  move $t1, $t0		# copy value to register for y
	# _tmp363 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp364 = y < _tmp363
	  slt $t2, $t1, $t0	
	# _tmp365 = y == _tmp363
	  seq $t3, $t1, $t0	
	# _tmp366 = _tmp364 || _tmp365
	  or $t0, $t2, $t3	
	# IfZ _tmp366 Goto _L63
	  sw $t0, -124($fp)	# spill _tmp366 from $t0 to $fp-124
	  sw $t1, -12($fp)	# spill y from $t1 to $fp-12
	  beqz $t0, _L63	# branch if _tmp366 is zero 
	# _tmp367 = "Invalid y dimension, try again\n"
	  .data			# create string constant marked with label
	  _string21: .asciiz "Invalid y dimension, try again\n"
	  .text
	  la $t0, _string21	# load label
	# PushParam _tmp367
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L63:
	# Goto _L61
	  b _L61		# unconditional branch
  _L62:
	# _tmp368 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 0($t0) 	# load with offset
	# _tmp369 = *(_tmp368)
	  lw $t2, 0($t1) 	# load with offset
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, -12($fp)	# fill y to $t1 from $fp-12
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, -8($fp)	# fill x to $t1 from $fp-8
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp369
	  sw $t2, -136($fp)	# spill _tmp369 from $t2 to $fp-136
	  jalr $t2            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp370 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# x = _tmp370
	  move $t1, $t0		# copy value to register for x
	# _tmp371 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# y = _tmp371
	  move $t2, $t0		# copy value to register for y
	# _tmp372 = "Would you like to use a random starting state?\n"
	  .data			# create string constant marked with label
	  _string22: .asciiz "Would you like to use a random starting state?\n"
	  .text
	  la $t0, _string22	# load label
	# PushParam _tmp372
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
	  sw $t2, -12($fp)	# spill y from $t2 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp373 = "Type 0 for no, anything else for yes\n"
	  .data			# create string constant marked with label
	  _string23: .asciiz "Type 0 for no, anything else for yes\n"
	  .text
	  la $t0, _string23	# load label
	# PushParam _tmp373
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp374 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# use_rand = _tmp374
	  move $t1, $t0		# copy value to register for use_rand
	# _tmp375 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp376 = use_rand == _tmp375
	  seq $t2, $t1, $t0	
	# _tmp377 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp378 = _tmp376 == _tmp377
	  seq $t1, $t2, $t0	
	# IfZ _tmp378 Goto _L64
	  sw $t1, -172($fp)	# spill _tmp378 from $t1 to $fp-172
	  beqz $t1, _L64	# branch if _tmp378 is zero 
	# _tmp379 = "Please enter an random seed\n"
	  .data			# create string constant marked with label
	  _string24: .asciiz "Please enter an random seed\n"
	  .text
	  la $t0, _string24	# load label
	# PushParam _tmp379
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp380 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# x = _tmp380
	  move $t1, $t0		# copy value to register for x
	# _tmp381 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp381
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp382 = LCall _Alloc
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp383 = rndModule
	  la $t1, rndModule	# load label
	# *(_tmp382) = _tmp383
	  sw $t1, 0($t0) 	# store with offset
	# *(this + 16) = _tmp382
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 16($t1) 	# store with offset
	# _tmp384 = *(this + 16)
	  lw $t0, 16($t1) 	# load with offset
	# _tmp385 = *(_tmp384)
	  lw $t2, 0($t0) 	# load with offset
	# _tmp386 = *(_tmp385)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, -8($fp)	# fill x to $t2 from $fp-8
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp384
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp386
	  sw $t3, -204($fp)	# spill _tmp386 from $t3 to $fp-204
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp387 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 20($t0) 	# load with offset
	# _tmp388 = *(this + 24)
	  lw $t2, 24($t0) 	# load with offset
	# _tmp389 = _tmp387 * _tmp388
	  mul $t3, $t1, $t2	
	# _tmp390 = *(this + 16)
	  lw $t1, 16($t0) 	# load with offset
	# _tmp391 = *(_tmp390)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp392 = *(_tmp391 + 8)
	  lw $t4, 8($t2) 	# load with offset
	# PushParam _tmp389
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp390
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp393 = ACall _tmp392
	  sw $t4, -228($fp)	# spill _tmp392 from $t4 to $fp-228
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# gen = _tmp393
	  move $t1, $t0		# copy value to register for gen
	  sw $t1, -16($fp)	# spill gen from $t1 to $fp-16
  _L65:
	# _tmp394 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp395 = _tmp394 < gen
	  lw $t1, -16($fp)	# fill gen to $t1 from $fp-16
	  slt $t2, $t0, $t1	
	# IfZ _tmp395 Goto _L66
	  sw $t2, -240($fp)	# spill _tmp395 from $t2 to $fp-240
	  beqz $t2, _L66	# branch if _tmp395 is zero 
	# _tmp396 = *(this + 20)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t1, 20($t0) 	# load with offset
	# _tmp397 = *(this + 16)
	  lw $t2, 16($t0) 	# load with offset
	# _tmp398 = *(_tmp397)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp399 = *(_tmp398 + 8)
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp396
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp397
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp400 = ACall _tmp399
	  sw $t4, -256($fp)	# spill _tmp399 from $t4 to $fp-256
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# x = _tmp400
	  move $t1, $t0		# copy value to register for x
	# _tmp401 = *(this + 24)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 24($t0) 	# load with offset
	# _tmp402 = *(this + 16)
	  lw $t3, 16($t0) 	# load with offset
	# _tmp403 = *(_tmp402)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp404 = *(_tmp403 + 8)
	  lw $t5, 8($t4) 	# load with offset
	# PushParam _tmp401
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp402
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp405 = ACall _tmp404
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
	  sw $t5, -276($fp)	# spill _tmp404 from $t5 to $fp-276
	  jalr $t5            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# y = _tmp405
	  move $t1, $t0		# copy value to register for y
	# _tmp406 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp407 = *(this)
	  lw $t2, 4($fp)	# fill this to $t2 from $fp+4
	  lw $t3, 0($t2) 	# load with offset
	# _tmp408 = *(_tmp407 + 4)
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp406
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill x to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp409 = ACall _tmp408
	  sw $t4, -292($fp)	# spill _tmp408 from $t4 to $fp-292
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp410 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp411 = gen - _tmp410
	  lw $t1, -16($fp)	# fill gen to $t1 from $fp-16
	  sub $t2, $t1, $t0	
	# gen = _tmp411
	  move $t1, $t2		# copy value to register for gen
	# Goto _L65
	  sw $t1, -16($fp)	# spill gen from $t1 to $fp-16
	  b _L65		# unconditional branch
  _L66:
	# Goto _L67
	  b _L67		# unconditional branch
  _L64:
	# _tmp412 = "Input initial live cell\n"
	  .data			# create string constant marked with label
	  _string25: .asciiz "Input initial live cell\n"
	  .text
	  la $t0, _string25	# load label
	# PushParam _tmp412
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L68:
	# _tmp413 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp414 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp415 = _tmp414 - _tmp413
	  sub $t2, $t1, $t0	
	# _tmp416 = x == _tmp415
	  lw $t0, -8($fp)	# fill x to $t0 from $fp-8
	  seq $t1, $t0, $t2	
	# _tmp417 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp418 = _tmp416 == _tmp417
	  seq $t2, $t1, $t0	
	# _tmp419 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp420 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp421 = _tmp420 - _tmp419
	  sub $t3, $t1, $t0	
	# _tmp422 = y == _tmp421
	  lw $t0, -12($fp)	# fill y to $t0 from $fp-12
	  seq $t1, $t0, $t3	
	# _tmp423 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp424 = _tmp422 == _tmp423
	  seq $t3, $t1, $t0	
	# _tmp425 = _tmp418 && _tmp424
	  and $t0, $t2, $t3	
	# IfZ _tmp425 Goto _L69
	  sw $t0, -360($fp)	# spill _tmp425 from $t0 to $fp-360
	  beqz $t0, _L69	# branch if _tmp425 is zero 
	# _tmp426 = "Enter x\n"
	  .data			# create string constant marked with label
	  _string26: .asciiz "Enter x\n"
	  .text
	  la $t0, _string26	# load label
	# PushParam _tmp426
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp427 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# x = _tmp427
	  move $t1, $t0		# copy value to register for x
	# _tmp428 = "Enter y\n"
	  .data			# create string constant marked with label
	  _string27: .asciiz "Enter y\n"
	  .text
	  la $t0, _string27	# load label
	# PushParam _tmp428
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t1, -8($fp)	# spill x from $t1 to $fp-8
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp429 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# y = _tmp429
	  move $t1, $t0		# copy value to register for y
	# _tmp430 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp431 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp432 = _tmp431 - _tmp430
	  sub $t3, $t2, $t0	
	# _tmp433 = x == _tmp432
	  lw $t0, -8($fp)	# fill x to $t0 from $fp-8
	  seq $t2, $t0, $t3	
	# _tmp434 = 1
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp435 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp436 = _tmp435 - _tmp434
	  sub $t5, $t4, $t3	
	# _tmp437 = y == _tmp436
	  seq $t3, $t1, $t5	
	# _tmp438 = _tmp433 && _tmp437
	  and $t4, $t2, $t3	
	# _tmp439 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp440 = _tmp438 == _tmp439
	  seq $t3, $t4, $t2	
	# IfZ _tmp440 Goto _L70
	  sw $t1, -12($fp)	# spill y from $t1 to $fp-12
	  sw $t3, -420($fp)	# spill _tmp440 from $t3 to $fp-420
	  beqz $t3, _L70	# branch if _tmp440 is zero 
	# _tmp441 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp442 = *(this)
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t2, 0($t1) 	# load with offset
	# _tmp443 = *(_tmp442 + 4)
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp441
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill y to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, -8($fp)	# fill x to $t2 from $fp-8
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp444 = ACall _tmp443
	  sw $t3, -432($fp)	# spill _tmp443 from $t3 to $fp-432
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp445 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp446 = _tmp444 == _tmp445
	  seq $t2, $t0, $t1	
	# IfZ _tmp446 Goto _L71
	  sw $t2, -444($fp)	# spill _tmp446 from $t2 to $fp-444
	  beqz $t2, _L71	# branch if _tmp446 is zero 
	# _tmp447 = "x = "
	  .data			# create string constant marked with label
	  _string28: .asciiz "x = "
	  .text
	  la $t0, _string28	# load label
	# PushParam _tmp447
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill x to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp448 = " and y = "
	  .data			# create string constant marked with label
	  _string29: .asciiz " and y = "
	  .text
	  la $t0, _string29	# load label
	# PushParam _tmp448
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill y to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp449 = "are bad coords\n"
	  .data			# create string constant marked with label
	  _string30: .asciiz "are bad coords\n"
	  .text
	  la $t0, _string30	# load label
	# PushParam _tmp449
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp450 = "Try again\n"
	  .data			# create string constant marked with label
	  _string31: .asciiz "Try again\n"
	  .text
	  la $t0, _string31	# load label
	# PushParam _tmp450
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L72
	  b _L72		# unconditional branch
  _L71:
	# _tmp451 = "Entering x = "
	  .data			# create string constant marked with label
	  _string32: .asciiz "Entering x = "
	  .text
	  la $t0, _string32	# load label
	# PushParam _tmp451
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam x
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill x to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp452 = ", y = "
	  .data			# create string constant marked with label
	  _string33: .asciiz ", y = "
	  .text
	  la $t0, _string33	# load label
	# PushParam _tmp452
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam y
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -12($fp)	# fill y to $t0 from $fp-12
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp453 = "\n"
	  .data			# create string constant marked with label
	  _string34: .asciiz "\n"
	  .text
	  la $t0, _string34	# load label
	# PushParam _tmp453
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L72:
  _L70:
	# Goto _L68
	  b _L68		# unconditional branch
  _L69:
  _L67:
	# _tmp454 = "How many generations would like you run?\n"
	  .data			# create string constant marked with label
	  _string35: .asciiz "How many generations would like you run?\n"
	  .text
	  la $t0, _string35	# load label
	# PushParam _tmp454
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp455 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# gen = _tmp455
	  move $t1, $t0		# copy value to register for gen
	# _tmp456 = *(this)
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	# _tmp457 = *(_tmp456 + 16)
	  lw $t3, 16($t2) 	# load with offset
	# PushParam gen
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam this
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp457
	  sw $t3, -488($fp)	# spill _tmp457 from $t3 to $fp-488
	  jalr $t3            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class life
	  .data
	  .align 2
	  life:		# label for class life vtable
	  .word _life.Init
	  .word _life.SetInit
	  .word _life.PrintMatrix
	  .word _life.DoLife
	  .word _life.runLife
	  .word _life.playLife
	  .text
  main:
	# BeginFunc 24
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 24	# decrement sp to make space for locals/temps
	# _tmp458 = 28
	  li $t0, 28		# load constant value 28 into $t0
	# PushParam _tmp458
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp459 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp460 = life
	  la $t1, life	# load label
	# *(_tmp459) = _tmp460
	  sw $t1, 0($t0) 	# store with offset
	# l = _tmp459
	  move $t1, $t0		# copy value to register for l
	# _tmp461 = *(l)
	  lw $t0, 0($t1) 	# load with offset
	# _tmp462 = *(_tmp461 + 20)
	  lw $t2, 20($t0) 	# load with offset
	# PushParam l
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp462
	  sw $t2, -28($fp)	# spill _tmp462 from $t2 to $fp-28
	  jalr $t2            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
_PrintInt:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 1
        lw   $a0, 4($fp)
        syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp)
        jr $ra
                                
_PrintString:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 4
        lw $a0, 4($fp)
        syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp)
        jr $ra
        
_PrintBool:
	subu $sp, $sp, 8
	sw $fp, 8($sp)
	sw $ra, 4($sp)
        addiu $fp, $sp, 8
	lw $t1, 4($fp)
	blez $t1, fbr
	li   $v0, 4		# system call for print_str
	la   $a0, TRUE		# address of str to print
	syscall			
	b end
fbr:	li   $v0, 4		# system call for print_str
	la   $a0, FALSE		# address of str to print
	syscall				
end:	move $sp, $fp
	lw $ra, -4($fp)
	lw $fp, 0($fp)
	jr $ra

_Alloc:
        subu $sp, $sp, 8
        sw $fp, 8($sp)
        sw $ra, 4($sp)
        addiu $fp, $sp, 8
        li   $v0, 9
        lw $a0, 4($fp)
	syscall
        move $sp, $fp
        lw $ra, -4($fp)
        lw $fp, 0($fp) 
        jr $ra


_StringEqual:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps

	li $v0,0

	#Determine length string 1
	lw $t0, 4($fp)       
	li $t3,0
bloop1: 
	lb $t5, ($t0) 
	beqz $t5, eloop1	
	addi $t0, 1
	addi $t3, 1
	b bloop1
eloop1:

	#Determine length string 2
	lw $t1, 8($fp)
	li $t4,0
bloop2: 
	lb $t5, ($t1) 
	beqz $t5, eloop2	
	addi $t1, 1
	addi $t4, 1
	b bloop2
eloop2:
	bne $t3,$t4,end1       #Check String Lengths Same

	lw $t0, 4($fp)       
	lw $t1, 8($fp)
	li $t3, 0     		
bloop3:	
	lb $t5, ($t0) 
	lb $t6, ($t1) 
	bne $t5, $t6, end1
	addi $t3, 1
	addi $t0, 1
	addi $t1, 1
	bne $t3,$t4,bloop3
eloop3:	li $v0,1

end1:	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra                # return from function

_Halt:
        li $v0, 10
        syscall

_ReadInteger:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps
	li $v0, 5
	syscall
	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra
        

_ReadLine:
	subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	sw $fp, 8($sp)        # save fp
	sw $ra, 4($sp)        # save ra
	addiu $fp, $sp, 8     # set up new fp
	subu $sp, $sp, 4      # decrement sp to make space for locals/temps
	li $a1, 40
	la $a0, SPACE
	li $v0, 8
	syscall

	la $t1, SPACE
bloop4: 
	lb $t5, ($t1) 
	beqz $t5, eloop4	
	addi $t1, 1
	b bloop4
eloop4:
	addi $t1,-1
	li $t6,0
        sb $t6, ($t1)

	la $v0, SPACE
	move $sp, $fp         # pop callee frame off stack
	lw $ra, -4($fp)       # restore saved ra
	lw $fp, 0($fp)        # restore saved fp
	jr $ra
	

	.data
TRUE:.asciiz "true"
FALSE:.asciiz "false"
SPACE:.asciiz "Making Space For Inputed Values Is Fun."
