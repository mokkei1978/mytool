
FC_XXX = fx100
#FC_XXX = pgf90

FC_fx100 = mpifrtpx
FFLAGS_fx100 = -Kfast
#FFLAGS_fx100 = -Kparallel,openmp,region_extension,ocl,parallel_fp_precision,preex,temparraystack,autoobjstack,noalias=s,ns,mfunc,prefetch_conditional,dalign -Koptmsg=2 -O3 -Q

FC_pgf90 = mpif90
FFLAGS_pgf90 =

FC = $(FC_$(FC_XXX))
FFLAGS = $(FFLAGS_$(FC_XXX))

targets := write_mpiio write_root write_1d3mpi
# read_mpiio read_root

all: $(targets)

clean:
	rm -f *~ $(targets) bench.sh.o* bench.sh.i* *.lst

%: %.F90
	$(FC) $(FFLAGS) $^ -o $@
