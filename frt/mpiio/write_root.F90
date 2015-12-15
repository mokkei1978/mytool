program main
  use mpi
  implicit none

!  integer,parameter :: npartx = 32, nparty = 12
  integer,parameter :: npartx = 64, nparty = 24
  integer,parameter :: dimx = 1024, dimy = 576, dimz = 240

  integer,parameter :: mloop = 6

  integer :: ierr, npe, ipe, i, i0, j0, m, k

  integer,parameter :: isize = dimx/npartx, jsize = dimy/nparty, ksize = dimz
  integer,parameter :: ijm = isize * jsize

  real(8) :: a(isize,jsize,ksize)

  real(8),allocatable :: b(:,:)
  integer :: ista(MPI_STATUS_SIZE)


  call mpi_init( ierr )
  call mpi_comm_size( mpi_comm_world, npe, ierr )
  call mpi_comm_rank( mpi_comm_world, ipe, ierr )

  a=0.d0
  if ( ipe == 0 ) then
    allocate( b(dimx,dimy) )
    open(10, file='temp/root.dat', form='unformatted', &
         & access='direct', recl=dimx*dimy*8 )
  endif

  do m = 1, mloop
    do k = 1, ksize

      a=dble(ipe+1)

      if ( ipe /= 0 ) then
        call mpi_send( a(1,1,k), ijm, mpi_double_precision, 0, ipe, mpi_comm_world, ierr )
      else
        b(:,:) = a(:,:,k)
        do i = 1, npe - 1
          i0 = mod( i, npartx ) * isize
          j0 = i / npartx * jsize
          call mpi_recv( a(1,1,k), ijm, mpi_double_precision, i, i, mpi_comm_world, ista, ierr )
          b(1+i0:isize+i0,1+j0:jsize+j0) = a(1:isize,1:jsize,k)
        enddo
        write(10,rec=(m-1)*ksize+k) b
      endif

    enddo
  enddo

  if ( ipe == 0 ) close(10)

  call mpi_finalize( ierr )

end program
