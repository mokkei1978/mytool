
target = main

F90     = pgf90
FFLAGS  = -tp k8-64 -mcmodel=medium -O -byteswapio -mp
LDFLAGS = -mcmodel=medium -mp

all: $(target)

clean:
	rm -f $(target) *~ log *.o

%.o: %.F90
	$(F90) $(FFLAGS) -c $< -o $@

%: %.o
	$(F90) $^ $(LDFLAGS) -o $@

main.o: main.F90 fir.o tide_killer.o
main: main.o fir.o tide_killer.o

