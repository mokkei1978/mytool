
target = main nopara

FC_XXX = front

F90_fx100 = frtpx
FFLAGS_fx100 = -Kfast,openmp
LDFLAGS_fx100 = -Kfast,openmp

F90_pgf90 = pgf90
FFLAGS_pgf90 =-tp k8-64 -mcmodel=medium -lacml -lacml_mv -O -byteswapio -mp
LDFLAGS_pgf90 = -mcmodel=medium -lacml -lacml_mv -mp

F90_gfort = gfortran
FFLAGS_gfort = -mcmodel=medium -ffree-line-length-none -fconvert=big-endian -O3 -fopenmp
LDFLAGS_gfort = -mcmodel=medium -fopenmp

F90_front = ifort
FFLAGS_front  = -mcmodel=large -convert big_endian -assume byterecl -xCORE-AVX512 -qopenmp -qopt-report=5
# -no-vec
LDFLAGS_front = -mcmodel=large -qopenmp

F90 = $(F90_$(FC_XXX))
FFLAGS = $(FFLAGS_$(FC_XXX))
LDFLAGS = $(LDFLAGS_$(FC_XXX))

all: $(target)

clean:
	rm -f $(target) *~ run*.sh.* *.optrpt

%.o: %.F90
	$(F90) $(FFLAGS) -c $< -o $@

%: %.o
	$(F90) $^ $(LDFLAGS) -o $@
