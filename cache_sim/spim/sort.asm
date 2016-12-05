	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _ReadArray:
	# BeginFunc 128
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 128	# decrement sp to make space for locals/temps
	# _tmp0 = "How many scores? "
	  .data			# create string constant marked with label
	  _string1: .asciiz "How many scores? "
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# numScores = _tmp1
	  move $t1, $t0		# copy value to register for numScores
	# _tmp2 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp3 = numScores < _tmp2
	  slt $t2, $t1, $t0	
	# IfZ _tmp3 Goto _L0
	  sw $t1, -20($fp)	# spill numScores from $t1 to $fp-20
	  sw $t2, -36($fp)	# spill _tmp3 from $t2 to $fp-36
	  beqz $t2, _L0	# branch if _tmp3 is zero 
	# _tmp4 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L0:
	# _tmp5 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp6 = _tmp5 + numScores
	  lw $t1, -20($fp)	# fill numScores to $t1 from $fp-20
	  add $t2, $t0, $t1	
	# _tmp7 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp8 = _tmp6 * _tmp7
	  mul $t3, $t2, $t0	
	# PushParam _tmp8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp9 = LCall _Alloc
	  sw $t0, -52($fp)	# spill _tmp7 from $t0 to $fp-52
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp9) = numScores
	  lw $t1, -20($fp)	# fill numScores to $t1 from $fp-20
	  sw $t1, 0($t0) 	# store with offset
	# _tmp10 = _tmp9 + _tmp7
	  lw $t1, -52($fp)	# fill _tmp7 to $t1 from $fp-52
	  add $t2, $t0, $t1	
	# arr = _tmp10
	  move $t0, $t2		# copy value to register for arr
	# _tmp11 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# i = _tmp11
	  move $t2, $t1		# copy value to register for i
	  sw $t0, -16($fp)	# spill arr from $t0 to $fp-16
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
  _L1:
	# _tmp12 = *(arr + -4)
	  lw $t0, -16($fp)	# fill arr to $t0 from $fp-16
	  lw $t1, -4($t0) 	# load with offset
	# _tmp13 = i < _tmp12
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp13 Goto _L2
	  sw $t3, -76($fp)	# spill _tmp13 from $t3 to $fp-76
	  beqz $t3, _L2	# branch if _tmp13 is zero 
	# _tmp14 = "Enter next number: "
	  .data			# create string constant marked with label
	  _string3: .asciiz "Enter next number: "
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# num = _tmp15
	  move $t1, $t0		# copy value to register for num
	# _tmp16 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp17 = i < _tmp16
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  slt $t3, $t2, $t0	
	# _tmp18 = *(arr + -4)
	  lw $t4, -16($fp)	# fill arr to $t4 from $fp-16
	  lw $t5, -4($t4) 	# load with offset
	# _tmp19 = i < _tmp18
	  slt $t6, $t2, $t5	
	# _tmp20 = _tmp19 == _tmp16
	  seq $t5, $t6, $t0	
	# _tmp21 = _tmp17 || _tmp20
	  or $t0, $t3, $t5	
	# IfZ _tmp21 Goto _L3
	  sw $t0, -108($fp)	# spill _tmp21 from $t0 to $fp-108
	  sw $t1, -12($fp)	# spill num from $t1 to $fp-12
	  beqz $t0, _L3	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp23 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp24 = _tmp23 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp25 = arr + _tmp24
	  lw $t0, -16($fp)	# fill arr to $t0 from $fp-16
	  add $t3, $t0, $t2	
	# *(_tmp25) = num
	  lw $t2, -12($fp)	# fill num to $t2 from $fp-12
	  sw $t2, 0($t3) 	# store with offset
	# _tmp26 = 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp27 = i + _tmp26
	  add $t3, $t1, $t2	
	# i = _tmp27
	  move $t1, $t3		# copy value to register for i
	# Goto _L1
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  b _L1		# unconditional branch
  _L2:
	# Return arr
	  lw $t0, -16($fp)	# fill arr to $t0 from $fp-16
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
  _Sort:
	# BeginFunc 304
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 304	# decrement sp to make space for locals/temps
	# _tmp28 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# i = _tmp28
	  move $t1, $t0		# copy value to register for i
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L4:
	# _tmp29 = *(arr + -4)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -4($t0) 	# load with offset
	# _tmp30 = i < _tmp29
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp30 Goto _L5
	  sw $t3, -28($fp)	# spill _tmp30 from $t3 to $fp-28
	  beqz $t3, _L5	# branch if _tmp30 is zero 
	# _tmp31 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp32 = i - _tmp31
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  sub $t2, $t1, $t0	
	# j = _tmp32
	  move $t0, $t2		# copy value to register for j
	# _tmp33 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp34 = i < _tmp33
	  slt $t3, $t1, $t2	
	# _tmp35 = *(arr + -4)
	  lw $t4, 4($fp)	# fill arr to $t4 from $fp+4
	  lw $t5, -4($t4) 	# load with offset
	# _tmp36 = i < _tmp35
	  slt $t6, $t1, $t5	
	# _tmp37 = _tmp36 == _tmp33
	  seq $t5, $t6, $t2	
	# _tmp38 = _tmp34 || _tmp37
	  or $t2, $t3, $t5	
	# IfZ _tmp38 Goto _L6
	  sw $t0, -12($fp)	# spill j from $t0 to $fp-12
	  sw $t2, -60($fp)	# spill _tmp38 from $t2 to $fp-60
	  beqz $t2, _L6	# branch if _tmp38 is zero 
	# _tmp39 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp39
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp40 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp41 = _tmp40 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp42 = arr + _tmp41
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  add $t3, $t0, $t2	
	# _tmp43 = *(_tmp42)
	  lw $t2, 0($t3) 	# load with offset
	# val = _tmp43
	  move $t3, $t2		# copy value to register for val
	  sw $t3, -16($fp)	# spill val from $t3 to $fp-16
  _L7:
	# _tmp44 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp45 = _tmp44 < j
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t0, $t1	
	# _tmp46 = _tmp44 == j
	  seq $t3, $t0, $t1	
	# _tmp47 = _tmp45 || _tmp46
	  or $t0, $t2, $t3	
	# IfZ _tmp47 Goto _L8
	  sw $t0, -96($fp)	# spill _tmp47 from $t0 to $fp-96
	  beqz $t0, _L8	# branch if _tmp47 is zero 
	# _tmp48 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp49 = j < _tmp48
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  slt $t2, $t1, $t0	
	# _tmp50 = *(arr + -4)
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp51 = j < _tmp50
	  slt $t5, $t1, $t4	
	# _tmp52 = _tmp51 == _tmp48
	  seq $t4, $t5, $t0	
	# _tmp53 = _tmp49 || _tmp52
	  or $t0, $t2, $t4	
	# IfZ _tmp53 Goto _L9
	  sw $t0, -120($fp)	# spill _tmp53 from $t0 to $fp-120
	  beqz $t0, _L9	# branch if _tmp53 is zero 
	# _tmp54 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp54
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp55 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp56 = _tmp55 * j
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  mul $t2, $t0, $t1	
	# _tmp57 = arr + _tmp56
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  add $t3, $t0, $t2	
	# _tmp58 = *(_tmp57)
	  lw $t2, 0($t3) 	# load with offset
	# _tmp59 = _tmp58 < val
	  lw $t3, -16($fp)	# fill val to $t3 from $fp-16
	  slt $t4, $t2, $t3	
	# _tmp60 = _tmp58 == val
	  seq $t5, $t2, $t3	
	# _tmp61 = _tmp59 || _tmp60
	  or $t2, $t4, $t5	
	# IfZ _tmp61 Goto _L10
	  sw $t2, -152($fp)	# spill _tmp61 from $t2 to $fp-152
	  beqz $t2, _L10	# branch if _tmp61 is zero 
	# Goto _L8
	  b _L8		# unconditional branch
  _L10:
	# _tmp62 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp63 = j + _tmp62
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# _tmp64 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp65 = _tmp63 < _tmp64
	  slt $t3, $t2, $t0	
	# _tmp66 = *(arr + -4)
	  lw $t4, 4($fp)	# fill arr to $t4 from $fp+4
	  lw $t5, -4($t4) 	# load with offset
	# _tmp67 = _tmp63 < _tmp66
	  slt $t6, $t2, $t5	
	# _tmp68 = _tmp67 == _tmp64
	  seq $t5, $t6, $t0	
	# _tmp69 = _tmp65 || _tmp68
	  or $t0, $t3, $t5	
	# IfZ _tmp69 Goto _L11
	  sw $t0, -184($fp)	# spill _tmp69 from $t0 to $fp-184
	  sw $t2, -160($fp)	# spill _tmp63 from $t2 to $fp-160
	  beqz $t0, _L11	# branch if _tmp69 is zero 
	# _tmp70 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp70
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp71 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp72 = _tmp71 * _tmp63
	  lw $t1, -160($fp)	# fill _tmp63 to $t1 from $fp-160
	  mul $t2, $t0, $t1	
	# _tmp73 = arr + _tmp72
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  add $t1, $t0, $t2	
	# _tmp74 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp75 = j < _tmp74
	  lw $t3, -12($fp)	# fill j to $t3 from $fp-12
	  slt $t4, $t3, $t2	
	# _tmp76 = *(arr + -4)
	  lw $t5, -4($t0) 	# load with offset
	# _tmp77 = j < _tmp76
	  slt $t6, $t3, $t5	
	# _tmp78 = _tmp77 == _tmp74
	  seq $t5, $t6, $t2	
	# _tmp79 = _tmp75 || _tmp78
	  or $t2, $t4, $t5	
	# IfZ _tmp79 Goto _L12
	  sw $t1, -200($fp)	# spill _tmp73 from $t1 to $fp-200
	  sw $t2, -224($fp)	# spill _tmp79 from $t2 to $fp-224
	  beqz $t2, _L12	# branch if _tmp79 is zero 
	# _tmp80 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string8	# load label
	# PushParam _tmp80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L12:
	# _tmp81 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp82 = _tmp81 * j
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  mul $t2, $t0, $t1	
	# _tmp83 = arr + _tmp82
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  add $t3, $t0, $t2	
	# _tmp84 = *(_tmp83)
	  lw $t2, 0($t3) 	# load with offset
	# *(_tmp73) = _tmp84
	  lw $t3, -200($fp)	# fill _tmp73 to $t3 from $fp-200
	  sw $t2, 0($t3) 	# store with offset
	# _tmp85 = 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp86 = j - _tmp85
	  sub $t3, $t1, $t2	
	# j = _tmp86
	  move $t1, $t3		# copy value to register for j
	# Goto _L7
	  sw $t1, -12($fp)	# spill j from $t1 to $fp-12
	  b _L7		# unconditional branch
  _L8:
	# _tmp87 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp88 = j + _tmp87
	  lw $t1, -12($fp)	# fill j to $t1 from $fp-12
	  add $t2, $t1, $t0	
	# _tmp89 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp90 = _tmp88 < _tmp89
	  slt $t1, $t2, $t0	
	# _tmp91 = *(arr + -4)
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp92 = _tmp88 < _tmp91
	  slt $t5, $t2, $t4	
	# _tmp93 = _tmp92 == _tmp89
	  seq $t4, $t5, $t0	
	# _tmp94 = _tmp90 || _tmp93
	  or $t0, $t1, $t4	
	# IfZ _tmp94 Goto _L13
	  sw $t0, -284($fp)	# spill _tmp94 from $t0 to $fp-284
	  sw $t2, -260($fp)	# spill _tmp88 from $t2 to $fp-260
	  beqz $t0, _L13	# branch if _tmp94 is zero 
	# _tmp95 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp95
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L13:
	# _tmp96 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp97 = _tmp96 * _tmp88
	  lw $t1, -260($fp)	# fill _tmp88 to $t1 from $fp-260
	  mul $t2, $t0, $t1	
	# _tmp98 = arr + _tmp97
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  add $t1, $t0, $t2	
	# *(_tmp98) = val
	  lw $t2, -16($fp)	# fill val to $t2 from $fp-16
	  sw $t2, 0($t1) 	# store with offset
	# _tmp99 = 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp100 = i + _tmp99
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  add $t3, $t2, $t1	
	# i = _tmp100
	  move $t2, $t3		# copy value to register for i
	# Goto _L4
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	  b _L4		# unconditional branch
  _L5:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _PrintArray:
	# BeginFunc 80
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp101 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp101
	  move $t1, $t0		# copy value to register for i
	# _tmp102 = "Sorted results: "
	  .data			# create string constant marked with label
	  _string10: .asciiz "Sorted results: "
	  .text
	  la $t0, _string10	# load label
	# PushParam _tmp102
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L14:
	# _tmp103 = *(arr + -4)
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  lw $t1, -4($t0) 	# load with offset
	# _tmp104 = i < _tmp103
	  lw $t2, -8($fp)	# fill i to $t2 from $fp-8
	  slt $t3, $t2, $t1	
	# IfZ _tmp104 Goto _L15
	  sw $t3, -24($fp)	# spill _tmp104 from $t3 to $fp-24
	  beqz $t3, _L15	# branch if _tmp104 is zero 
	# _tmp105 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp106 = i < _tmp105
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  slt $t2, $t1, $t0	
	# _tmp107 = *(arr + -4)
	  lw $t3, 4($fp)	# fill arr to $t3 from $fp+4
	  lw $t4, -4($t3) 	# load with offset
	# _tmp108 = i < _tmp107
	  slt $t5, $t1, $t4	
	# _tmp109 = _tmp108 == _tmp105
	  seq $t4, $t5, $t0	
	# _tmp110 = _tmp106 || _tmp109
	  or $t0, $t2, $t4	
	# IfZ _tmp110 Goto _L16
	  sw $t0, -48($fp)	# spill _tmp110 from $t0 to $fp-48
	  beqz $t0, _L16	# branch if _tmp110 is zero 
	# _tmp111 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string11	# load label
	# PushParam _tmp111
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L16:
	# _tmp112 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp113 = _tmp112 * i
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  mul $t2, $t0, $t1	
	# _tmp114 = arr + _tmp113
	  lw $t0, 4($fp)	# fill arr to $t0 from $fp+4
	  add $t3, $t0, $t2	
	# _tmp115 = *(_tmp114)
	  lw $t2, 0($t3) 	# load with offset
	# PushParam _tmp115
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp116 = " "
	  .data			# create string constant marked with label
	  _string12: .asciiz " "
	  .text
	  la $t0, _string12	# load label
	# PushParam _tmp116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp117 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp118 = i + _tmp117
	  lw $t1, -8($fp)	# fill i to $t1 from $fp-8
	  add $t2, $t1, $t0	
	# i = _tmp118
	  move $t1, $t2		# copy value to register for i
	# Goto _L14
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  b _L14		# unconditional branch
  _L15:
	# _tmp119 = "\n"
	  .data			# create string constant marked with label
	  _string13: .asciiz "\n"
	  .text
	  la $t0, _string13	# load label
	# PushParam _tmp119
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 16
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp120 = "\nThis program will read in a bunch of numbers an..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "\nThis program will read in a bunch of numbers and print them\n"
	  .text
	  la $t0, _string14	# load label
	# PushParam _tmp120
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp121 = "back out in sorted order.\n\n"
	  .data			# create string constant marked with label
	  _string15: .asciiz "back out in sorted order.\n\n"
	  .text
	  la $t0, _string15	# load label
	# PushParam _tmp121
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp122 = LCall _ReadArray
	  jal _ReadArray     	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# arr = _tmp122
	  move $t1, $t0		# copy value to register for arr
	# PushParam arr
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _Sort
	  sw $t1, -8($fp)	# spill arr from $t1 to $fp-8
	  jal _Sort          	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam arr
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# fill arr to $t0 from $fp-8
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintArray
	  jal _PrintArray    	# jump to function
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
