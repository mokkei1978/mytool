program main
  use mpi
  implicit none

  integer,parameter :: im = 10000, jm = 13420, km = 20  !- km GB
  real(8),allocatable :: d(:,:,:)

  integer :: i, np, ip, ierr
  real(8) :: cpu

  call mpi_init(i)
  call mpi_comm_size(mpi_comm_world,np,ierr)
  call mpi_comm_rank(mpi_comm_world,ip,ierr)

  do i = 0, np - 1
    call mpi_barrier(mpi_comm_world,ierr)
    if ( i /= ip ) cycle

    write(6,*) (im*8/1024)*(jm*km/1024),'MB at ',ip,'/',np
    allocate( d(im,jm,km) )
    d=1.d0
    write(6,*) d(im,jm,km)
    deallocate( d )

  enddo

  call mpi_barrier(mpi_comm_world,ierr)
  call mpi_finalize(i)

end program main
