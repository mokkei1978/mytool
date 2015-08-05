targets := small_topo

all: $(targets)
clean:
	rm -f *.o core $(targets) *~ */*~ test/*~ *.d *.ctl

F90=pgf90
FFLAGS=-tp k8-64 -mcmodel=medium -lacml -lacml_mv -O -byteswapio
LDFLAGS=-mcmodel=medium -lacml -lacml_mv

vpath %.F90 src

%.o: %.F90
	$(F90) $< -c $(FFLAGS) -o $@

%: %.o
	$(F90) $^ $(LDFLAGS) -o $@
