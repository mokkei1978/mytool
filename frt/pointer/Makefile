
target = temp

F90 = mpifrtpx
FFLAGS = -Kparallel,region_extension,ocl,parallel_fp_precision,preex,temparraystack,autoobjstack,noalias=s,ns,mfunc,prefetch_conditional,dalign -Koptmsg=2 -O3 -Qt 
LDFLAGS = -Kparallel,region_extension,ocl,parallel_fp_precision,preex,temparraystack,autoobjstack,noalias=s,ns,mfunc,prefetch_conditional,dalign -Koptmsg=2 -O3 -Qt

all: $(target)

clean:
	rm -f $(target) *.lst *~ log run.sh.*

%.o: %.F90
	$(F90) $(FFLAGS) -c $< -o $@

%: %.o
	$(F90) $^ $(LDFLAGS) -o $@
