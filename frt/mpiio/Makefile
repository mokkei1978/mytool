
FC_XXX = mri
#FC_XXX = pgf90
#FC_XXX = gfortran

FC_mri = mpiifort
FFLAGS_mri = -xCORE-AVX512 -O3 -V -qopt-report=1 -convert big_endian -mcmodel=large -assume byterecl

FC_pgf90 = mpif90
FFLAGS_pgf90 =

FC_gfortran = mpif90
FFLAGS_gfortran  = -mcmodel=large -O3 -fopenmp

FC = $(FC_$(FC_XXX))
FFLAGS = $(FFLAGS_$(FC_XXX))

targets := write_1d3mpi

all: $(targets)

clean:
	rm -f *~ $(targets) bench.sh.o* bench.sh.i* *.lst *.optrpt

%: %.F90
	$(FC) $(FFLAGS) $^ -o $@
