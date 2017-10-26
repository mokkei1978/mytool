
target = main

F90 = pgf90
FFLAGS = -tp k8-64 -mcmodel=medium -lacml -lacml_mv -O -byteswapio -mp
LDFLAGS = -mcmodel=medium -lacml -lacml_mv -mp

all: $(target)

clean:
	rm -f $(target) *~

%.o: %.F90
	$(F90) $(FFLAGS) -c $< -o $@

%: %.o
	$(F90) $^ $(LDFLAGS) -o $@
