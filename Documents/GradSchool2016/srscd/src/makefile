#
#   $Header: 
#
#SHELL = /bin/sh

# -------------------End-macro-Defs---------------------------
#define all fortan source code


SRC =			dprand.f90\
			Debug_subroutines.f90\
			Defect_attributes.f90\
			MeshReader.f90\
			ReactionRates.f90\
			Initialization_subroutines.f90\
			Read_inputs.f90\
			Cascade_implantation.f90\
			SRSCD_par.f90\
			kMC_subroutines.f90\
			Deallocate_Lists.f90\
			FineMesh_subroutines.f90\
			CoarseMesh_subroutines.f90\
			Misc_functions.f90\
			StrainSubroutines.f90\
			Postprocessing_srscd.f90

MOD =			mod_derivedtypes.f90\
			mod_srscd_constants.f90

SINGLEF =       mpi_fortran.f

#INCLUDE =               param.h\

# Definitions

BIN_DIR = 	$(HOME)/bin

BIN_MAC = /bin

ROOT =		srscd

FC =            f95

EXE =		$(ROOT)_$@

SRCF = 		$(MOD) $(SRC)

SRCF1N =        $(MOD) $(SRC) $(SINGLEF)

#INC =           $(INCLUDE)

OBJ = 		$(SRCF:.f90=.o)

OBJ1N=		$(SRCF1N:.f90=.o)

# Help

help:
	@echo 'Type "make target" where target is one of:'
	@echo '      intel      (linux Intel)'
	@echo '		 mac		(mac mpif90)'
	@echo '      gfort      (linux gfortran)'
	@echo '      tools      (make pre-processing and postprocessing tools)'
	@echo '                                                     '
	@echo ' NOTE: preceed target with 'l' puts objects in current directory'

#	
# Targets
#       the pc Targets have the *.obj files while the unix targets use *.o
#

#  sub directory targets for the object files
#   linux and MacOS Targets

intel gfort:
	@if [ ! -d obj_$@ ]; then mkdir obj_$@; fi
	@cp -p $(SRCF) obj_$@
	@cp ./MAKE/make_$@.mak obj_$@/makefile
	@cd obj_$@; \
	$(MAKE) "OBJ = $(OBJ)" "EXE=../$(EXE)" "BIN=$(BIN_DIR)" ../$(EXE)\ 
	@if [ -d obj_$@ ]; then cd obj_$@; rm -f makefile ; fi
	
mac:
	@if [ ! -d obj_$@ ]; then mkdir obj_$@; fi
	@cp -p $(SRCF) obj_$@
	@cp ./MAKE/make_$@.mak obj_$@/makefile
	@cd obj_$@; \
	$(MAKE) "OBJ = $(OBJ)" "EXE=../$(EXE)" "BIN=$(BIN_MAC)" ../$(EXE)\ 
	@if [ -d obj_$@ ]; then cd obj_$@; rm -f makefile ; fi

tools:
	$(FC) -o MeshGen ../tools/MeshGenerator/MeshGen.f90
	mv MeshGen $(BIN_DIR)
		
# Cleans

clean_intel:
	rm -r obj_intel

clean_gfort:
	rm -r obj_gfort
