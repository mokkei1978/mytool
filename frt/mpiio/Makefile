
targets := write_mpiio write_root read_mpiio read_root

all: $(targets)

clean:
	rm -f *~ $(targets) 

%: %.F90
	mpif90 $^ -o $@
