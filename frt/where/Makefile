
FC_XXX = gfortran
#FC_XXX = pgf90
#FC_XXX = fx100
#FC_XXX = cx2550

FC_fx100 = frtpx
FFLAGS_fx100 = -Kocl,optmsg=2 -Qt -O2 #-Kfast

FC_cx2550 = frt
FFLAGS_cx2550 = -O2 -Kocl,optmsg=2 -Qt

FC_pgf90 = mpif90
FFLAGS_pgf90 = -tp k8-64 -mcmodel=medium -O2

FC_gfortran = gfortran
#FFLAGS_gfortran = -Wall -pedantic -std=f95 -fbounds-check -O -Wuninitialized -ffpe-trap=invalid,zero,overflow -fbacktrace -fconvert=big-endian
FFLAGS_gfortran = -O3 -fconvert=big-endian

FC = $(FC_$(FC_XXX))
FFLAGS = $(FFLAGS_$(FC_XXX))

CPP =

targets := main

all: $(targets)

clean:
	rm -f *~ $(targets) *.lst

%: %.F90
	$(FC) $(FFLAGS) $(CPP) $^ -o $@
