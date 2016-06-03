program main
  use mpi
  implicit none

  integer,parameter :: im = 10000, jm = 20000
  real(8),allocatable :: d(:,:)

  integer :: i, np, ip, j2

  call mpi_init(i)
  call mpi_comm_size(mpi_comm_world,np,i)
  call mpi_comm_rank(mpi_comm_world,ip,i)


  if ( ip == 0 ) then
    j2 = 16
  else
    j2 = 1
  endif

  write(6,*) (im*8/1024)*(jm*j2/1024),'MB at ',ip,'/',np
  allocate( d(im,jm*j2) )

  d=1.d0

  write(6,*) np,ip,d(im,jm)

  deallocate( d )

  call mpi_finalize(i)

end program main
