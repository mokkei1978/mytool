
FC_XXX = gfortran
#FC_XXX = pgf90

#FC_fx100 = mpifrtpx
#FFLAGS_fx100 = -Kfast

FC_pgf90 = mpif90
FFLAGS_pgf90 =

FC_gfortran = gfortran
FFLAGS_gfortran = -Wall -pedantic -std=f95 -fbounds-check -O -Wuninitialized -ffpe-trap=invalid,zero,overflow -fbacktrace -fconvert=big-endian

FC = $(FC_$(FC_XXX))
FFLAGS = $(FFLAGS_$(FC_XXX))

targets := complex
# read_mpiio read_root

all: $(targets)

clean:
	rm -f *~ $(targets) *.lst

%: %.F90
	$(FC) $(FFLAGS) $^ -o $@
