program main
  use mpi
  implicit none

  integer,parameter :: im = 10000, jm = 10000
  real(8),allocatable,target :: d(:,:)
  real(8),pointer :: d2(:,:),d3(:,:),d4(:,:),d5(:,:),d6(:,:),d7(:,:),d8(:,:),d9(:,:)

  integer :: i, np, ip, j2

  call mpi_init(i)
  call mpi_comm_size(mpi_comm_world,np,i)
  call mpi_comm_rank(mpi_comm_world,ip,i)


  if ( ip == 0 ) then
    j2 = 16
  else
    j2 = 1
  endif

  write(6,*) (im*8/1024)*(jm*j2/1024)*2,'MB at ',ip,'/',np
  allocate( d(im,jm*j2) )
!  allocate( d2(im,jm*j2) )
  d2 => d
  d3 => d
  d4 => d
  d5 => d
  d6 => d
  d7 => d
  d8 => d
  d9 => d

  d=1.d0

  write(6,*) np,ip,d9(im,jm)

  deallocate( d )

  call mpi_finalize(i)

end program main
