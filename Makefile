##
## Simple makefile for decaf programming projects
##


.PHONY: clean strip

# Set the default target. When you make with no arguments,
# this will be the target built.
COMPILER = dcc
PRODUCTS = $(COMPILER)
default: $(PRODUCTS)

# Set up the list of source and object files
SRCS = ast.cc ast_decl.cc ast_expr.cc ast_stmt.cc ast_type.cc scope.cc \
	codegen.cc tac.cc mips.cc errors.cc utility.cc main.cc cfg.cc live_variable.cc \
  effector.cc effector_factory.cc

# OBJS can deal with either .cc or .c files listed in SRCS
OBJS = y.tab.o lex.yy.o $(patsubst %.cc, %.o, $(filter %.cc,$(SRCS))) $(patsubst %.c, %.o, $(filter %.c, $(SRCS)))

JUNK =  *.o lex.yy.c dpp.yy.c y.tab.c y.tab.h *.core core $(COMPILER).purify purify.log

# Define the tools we are going to use
CC= g++
LD = g++
LEX = flex
YACC = bison

# Set up the necessary flags for the tools

# We want debugging and most warnings, but lex/yacc generate some
# static symbols we don't use, so turn off unused warnings to avoid clutter
# STL has some signed/unsigned comparisons we want to suppress
CFLAGS = -g  -Wall -Wno-unused -Wno-sign-compare -Wno-deprecated

# The -d flag tells lex to set up for debugging. Can turn on/off by
# setting value of global yy_flex_debug inside the scanner itself
LEXFLAGS = -d

# The -d flag tells yacc to generate header with token types
# The -v flag writes out a verbose description of the states and conflicts
# The -t flag turns on debugging capability
# The -y flag means imitate yacc's output file naming conventions
YACCFLAGS = -dvty

# Link with standard c library, math library, and lex library
LIBS = -lc -lm

# Rules for various parts of the target

.yy.o: $*.yy.c
	$(CC) $(CFLAGS) -c -o $@ $*.cc

lex.yy.c: scanner.l  parser.y y.tab.h
	$(LEX) $(LEXFLAGS) scanner.l

y.tab.o: y.tab.c
	$(CC) $(CFLAGS) -c -o y.tab.o y.tab.c

y.tab.h y.tab.c: parser.y
	$(YACC) $(YACCFLAGS) parser.y
.cc.o: $*.cc
	$(CC) $(CFLAGS) -c -o $@ $*.cc

# rules to build compiler (dcc)

$(COMPILER) :  $(OBJS)
	$(LD) -o $@ $(OBJS) $(LIBS)

$(COMPILER).purify : $(OBJS)
	purify -log-file=purify.log -cache-dir=/tmp/$(USER) -leaks-at-exit=no $(LD) -o $@ $(OBJS) $(LIBS)


# This target is to build small for testing (no debugging info), removes
# all intermediate products, too
strip : $(PRODUCTS)
	strip $(PRODUCTS)
	rm -rf $(JUNK)

.PHONY: test
test: $(COMPILER)
	@./test.sh

# make depend will set up the header file dependencies for the
# assignment.  You should make depend whenever you add a new header
# file to the project or move the project between machines
#
depend:
	makedepend -- $(CFLAGS) -- $(SRCS)

clean:
	rm -f $(JUNK) y.output $(PRODUCTS)

# DO NOT DELETE

ast.o: ast.h /usr/include/stdlib.h /usr/include/features.h
ast.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
ast.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ast.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
ast.o: /usr/include/sys/types.h /usr/include/bits/types.h
ast.o: /usr/include/bits/typesizes.h /usr/include/time.h
ast.o: /usr/include/endian.h /usr/include/bits/endian.h
ast.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
ast.o: /usr/include/sys/select.h /usr/include/bits/select.h
ast.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ast.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ast.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h location.h
ast.o: ast_type.h list.h utility.h /usr/include/stdio.h /usr/include/libio.h
ast.o: /usr/include/_G_config.h /usr/include/wchar.h
ast.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h scope.h
ast.o: hashtable.h /usr/include/string.h /usr/include/xlocale.h hashtable.cc
ast.o: ast_decl.h ast_stmt.h errors.h
ast_decl.o: ast_decl.h ast.h /usr/include/stdlib.h /usr/include/features.h
ast_decl.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
ast_decl.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ast_decl.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
ast_decl.o: /usr/include/sys/types.h /usr/include/bits/types.h
ast_decl.o: /usr/include/bits/typesizes.h /usr/include/time.h
ast_decl.o: /usr/include/endian.h /usr/include/bits/endian.h
ast_decl.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
ast_decl.o: /usr/include/sys/select.h /usr/include/bits/select.h
ast_decl.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ast_decl.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ast_decl.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h location.h
ast_decl.o: list.h utility.h /usr/include/stdio.h /usr/include/libio.h
ast_decl.o: /usr/include/_G_config.h /usr/include/wchar.h
ast_decl.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ast_decl.o: scope.h hashtable.h /usr/include/string.h /usr/include/xlocale.h
ast_decl.o: hashtable.cc ast_stmt.h ast_type.h errors.h scanner.h codegen.h
ast_decl.o: tac.h
ast_expr.o: ast_expr.h ast.h /usr/include/stdlib.h /usr/include/features.h
ast_expr.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
ast_expr.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ast_expr.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
ast_expr.o: /usr/include/sys/types.h /usr/include/bits/types.h
ast_expr.o: /usr/include/bits/typesizes.h /usr/include/time.h
ast_expr.o: /usr/include/endian.h /usr/include/bits/endian.h
ast_expr.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
ast_expr.o: /usr/include/sys/select.h /usr/include/bits/select.h
ast_expr.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ast_expr.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ast_expr.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h location.h
ast_expr.o: ast_stmt.h list.h utility.h /usr/include/stdio.h
ast_expr.o: /usr/include/libio.h /usr/include/_G_config.h
ast_expr.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
ast_expr.o: /usr/include/bits/sys_errlist.h scope.h hashtable.h
ast_expr.o: /usr/include/string.h /usr/include/xlocale.h hashtable.cc
ast_expr.o: ast_type.h ast_decl.h errors.h codegen.h tac.h
ast_stmt.o: ast_stmt.h list.h utility.h /usr/include/stdlib.h
ast_stmt.o: /usr/include/features.h /usr/include/stdc-predef.h
ast_stmt.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ast_stmt.o: /usr/include/gnu/stubs.h /usr/include/bits/waitflags.h
ast_stmt.o: /usr/include/bits/waitstatus.h /usr/include/sys/types.h
ast_stmt.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ast_stmt.o: /usr/include/time.h /usr/include/endian.h
ast_stmt.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ast_stmt.o: /usr/include/bits/byteswap-16.h /usr/include/sys/select.h
ast_stmt.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
ast_stmt.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
ast_stmt.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
ast_stmt.o: /usr/include/bits/stdlib-float.h /usr/include/stdio.h
ast_stmt.o: /usr/include/libio.h /usr/include/_G_config.h
ast_stmt.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
ast_stmt.o: /usr/include/bits/sys_errlist.h scope.h hashtable.h
ast_stmt.o: /usr/include/string.h /usr/include/xlocale.h hashtable.cc ast.h
ast_stmt.o: location.h ast_type.h ast_decl.h ast_expr.h errors.h codegen.h
ast_stmt.o: tac.h
ast_type.o: ast_type.h ast.h /usr/include/stdlib.h /usr/include/features.h
ast_type.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
ast_type.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ast_type.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
ast_type.o: /usr/include/sys/types.h /usr/include/bits/types.h
ast_type.o: /usr/include/bits/typesizes.h /usr/include/time.h
ast_type.o: /usr/include/endian.h /usr/include/bits/endian.h
ast_type.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
ast_type.o: /usr/include/sys/select.h /usr/include/bits/select.h
ast_type.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ast_type.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ast_type.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h location.h
ast_type.o: list.h utility.h /usr/include/stdio.h /usr/include/libio.h
ast_type.o: /usr/include/_G_config.h /usr/include/wchar.h
ast_type.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ast_type.o: scope.h hashtable.h /usr/include/string.h /usr/include/xlocale.h
ast_type.o: hashtable.cc ast_decl.h ast_stmt.h errors.h codegen.h tac.h
scope.o: scope.h hashtable.h /usr/include/string.h /usr/include/features.h
scope.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
scope.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
scope.o: /usr/include/xlocale.h hashtable.cc ast_decl.h ast.h
scope.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
scope.o: /usr/include/bits/waitstatus.h /usr/include/sys/types.h
scope.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
scope.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
scope.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
scope.o: /usr/include/sys/select.h /usr/include/bits/select.h
scope.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
scope.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
scope.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h location.h
scope.o: list.h utility.h /usr/include/stdio.h /usr/include/libio.h
scope.o: /usr/include/_G_config.h /usr/include/wchar.h
scope.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
scope.o: ast_stmt.h
codegen.o: codegen.h tac.h list.h utility.h /usr/include/stdlib.h
codegen.o: /usr/include/features.h /usr/include/stdc-predef.h
codegen.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
codegen.o: /usr/include/gnu/stubs.h /usr/include/bits/waitflags.h
codegen.o: /usr/include/bits/waitstatus.h /usr/include/sys/types.h
codegen.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
codegen.o: /usr/include/time.h /usr/include/endian.h
codegen.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
codegen.o: /usr/include/bits/byteswap-16.h /usr/include/sys/select.h
codegen.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
codegen.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
codegen.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
codegen.o: /usr/include/bits/stdlib-float.h /usr/include/stdio.h
codegen.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
codegen.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
codegen.o: scope.h hashtable.h /usr/include/string.h /usr/include/xlocale.h
codegen.o: hashtable.cc mips.h cfg.h live_variable.h df_base.h ast_decl.h
codegen.o: ast.h location.h ast_stmt.h errors.h
tac.o: tac.h list.h utility.h /usr/include/stdlib.h /usr/include/features.h
tac.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
tac.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
tac.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
tac.o: /usr/include/sys/types.h /usr/include/bits/types.h
tac.o: /usr/include/bits/typesizes.h /usr/include/time.h
tac.o: /usr/include/endian.h /usr/include/bits/endian.h
tac.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
tac.o: /usr/include/sys/select.h /usr/include/bits/select.h
tac.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
tac.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
tac.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
tac.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
tac.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
tac.o: /usr/include/bits/sys_errlist.h scope.h hashtable.h
tac.o: /usr/include/string.h /usr/include/xlocale.h hashtable.cc mips.h cfg.h
tac.o: live_variable.h df_base.h
mips.o: mips.h tac.h list.h utility.h /usr/include/stdlib.h
mips.o: /usr/include/features.h /usr/include/stdc-predef.h
mips.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
mips.o: /usr/include/gnu/stubs.h /usr/include/bits/waitflags.h
mips.o: /usr/include/bits/waitstatus.h /usr/include/sys/types.h
mips.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
mips.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
mips.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
mips.o: /usr/include/sys/select.h /usr/include/bits/select.h
mips.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
mips.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
mips.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
mips.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
mips.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
mips.o: /usr/include/bits/sys_errlist.h scope.h hashtable.h
mips.o: /usr/include/string.h /usr/include/xlocale.h hashtable.cc cfg.h
mips.o: live_variable.h df_base.h
errors.o: errors.h location.h /usr/include/stdio.h /usr/include/features.h
errors.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
errors.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
errors.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
errors.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
errors.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
errors.o: scanner.h ast_type.h ast.h /usr/include/stdlib.h
errors.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
errors.o: /usr/include/sys/types.h /usr/include/time.h /usr/include/endian.h
errors.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
errors.o: /usr/include/bits/byteswap-16.h /usr/include/sys/select.h
errors.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
errors.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
errors.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
errors.o: /usr/include/bits/stdlib-float.h list.h utility.h scope.h
errors.o: hashtable.h /usr/include/string.h /usr/include/xlocale.h
errors.o: hashtable.cc ast_expr.h ast_stmt.h ast_decl.h
utility.o: utility.h /usr/include/stdlib.h /usr/include/features.h
utility.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
utility.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
utility.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
utility.o: /usr/include/sys/types.h /usr/include/bits/types.h
utility.o: /usr/include/bits/typesizes.h /usr/include/time.h
utility.o: /usr/include/endian.h /usr/include/bits/endian.h
utility.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
utility.o: /usr/include/sys/select.h /usr/include/bits/select.h
utility.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
utility.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
utility.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
utility.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
utility.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
utility.o: /usr/include/bits/sys_errlist.h list.h scope.h hashtable.h
utility.o: /usr/include/string.h /usr/include/xlocale.h hashtable.cc
main.o: /usr/include/string.h /usr/include/features.h
main.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
main.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
main.o: /usr/include/xlocale.h /usr/include/stdio.h /usr/include/bits/types.h
main.o: /usr/include/bits/typesizes.h /usr/include/libio.h
main.o: /usr/include/_G_config.h /usr/include/wchar.h
main.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
main.o: utility.h /usr/include/stdlib.h /usr/include/bits/waitflags.h
main.o: /usr/include/bits/waitstatus.h /usr/include/sys/types.h
main.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
main.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
main.o: /usr/include/sys/select.h /usr/include/bits/select.h
main.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
main.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
main.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h errors.h
main.o: location.h parser.h scanner.h list.h scope.h hashtable.h hashtable.cc
main.o: ast.h ast_type.h ast_decl.h ast_stmt.h ast_expr.h
cfg.o: cfg.h tac.h list.h utility.h /usr/include/stdlib.h
cfg.o: /usr/include/features.h /usr/include/stdc-predef.h
cfg.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
cfg.o: /usr/include/gnu/stubs.h /usr/include/bits/waitflags.h
cfg.o: /usr/include/bits/waitstatus.h /usr/include/sys/types.h
cfg.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
cfg.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
cfg.o: /usr/include/bits/byteswap.h /usr/include/bits/byteswap-16.h
cfg.o: /usr/include/sys/select.h /usr/include/bits/select.h
cfg.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
cfg.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
cfg.o: /usr/include/alloca.h /usr/include/bits/stdlib-float.h
cfg.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
cfg.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
cfg.o: /usr/include/bits/sys_errlist.h scope.h hashtable.h
cfg.o: /usr/include/string.h /usr/include/xlocale.h hashtable.cc
live_variable.o: df_base.h
