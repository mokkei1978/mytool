
FC_XXX = pgf90

FC_fx100 = mpifrtpx
FFLAGS_fx100 = -Kfast

FC_pgf90 = mpif90
FFLAGS_pgf90 =

FC = $(FC_$(FC_XXX))
FFLAGS = $(FFLAGS_$(FC_XXX))

targets := judge
# read_mpiio read_root

all: $(targets)

clean:
	rm -f *~ $(targets) *.lst

%: %.F90
	$(FC) $(FFLAGS) $^ -o $@
