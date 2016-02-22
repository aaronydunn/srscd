# Makefile using Intel compiler

#SHELL = c:\local\mkstools\mksnt\sh
.IGNORE:

# System-specific settings

FF =		mpif90
FFLAGS =	
CC =
CCFLAGS =	
LINK =		mpif90
LINKFLAGS =	
USRLIB =	
SYSLIB = 

###SIZE =		size

# Link rule

$(EXE):	$(OBJ)
	$(LINK) $(LINKFLAGS) $(OBJ) $(USRLIB) $(SYSLIB) -o $(EXE)
	mv $(EXE) $(BIN)

# Compilation rules

%.o:
	$(FF) $(FFLAGS) -c $*.f90 -o $*.o

.c.o:
	$(CC) $(CCFLAGS) -c $*.c -o $*.o

