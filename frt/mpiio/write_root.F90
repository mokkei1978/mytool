program main
  use mpi
  implicit none

  integer,parameter :: npartx = 2, nparty = 2
  integer,parameter :: dimx = 1024, dimy = 512, dimz = 240

  integer :: ierr, npe, ipe, i, i0, j0, istat

  integer,parameter :: isize = dimx/npartx, jsize = dimy/nparty, ksize = dimz
  integer,parameter :: ijkm = isize * jsize * ksize

  real(8) :: a(isize,jsize,ksize)

  real(8),allocatable :: b(:,:,:)
  integer :: ista(MPI_STATUS_SIZE)


  call mpi_init( ierr )
  call mpi_comm_size( mpi_comm_world, npe, ierr )
  call mpi_comm_rank( mpi_comm_world, ipe, ierr )

  a=0.d0

  if ( ipe /= 0 ) then
    call mpi_send( a(1,1,1), ijkm, mpi_double_precision, 0, ipe, mpi_comm_world, ierr )

  else
    allocate( b(dimx,dimy,dimz) )
    b(1:isize,1:jsize,1:ksize) = a(1:isize,1:jsize,1:ksize)
    do i = 1, npe - 1
      i0 = mod( i, npartx ) * isize
      j0 = i / npartx * jsize
      call mpi_recv( a(1,1,1), ijkm, mpi_double_precision, i, i, mpi_comm_world, ista, ierr )
      b(1+i0:isize+i0,1+j0:jsize+j0,1:ksize) = a(1:isize,1:jsize,1:ksize)

    enddo

    open(10, file='temp/root.dat', form='unformatted', &
         & access='direct', recl=dimx*dimy*dimz*8 )
    write(10,rec=1) b
    close(10)

  endif

  call mpi_finalize( ierr )

end program
