!- 3MPI, rank ( 0, 1, 2, 2 )
program main
  use mpi
  implicit none

  integer,parameter :: npartx = 4, nparty = 1
  integer,parameter :: dimx = 1024
  character(*),parameter :: fileo = 'temp/mpiio_1d.dat'

  integer,parameter :: isize = dimx/npartx
  integer :: type_file1d
  integer :: ierr, npe, ipe, is, ifirst, handle, i
  integer :: isize_map(0:2) =(/ isize, isize, isize*2 /)
  integer :: ifirst_map(0:2)

  real(8),allocatable :: a(:)

  call mpi_init( ierr )
  call mpi_comm_size( mpi_comm_world, npe, ierr )
  call mpi_comm_rank( mpi_comm_world, ipe, ierr )

  ifirst_map(0) = 0
  do i = 1, npe-1
    ifirst_map(i) = ifirst_map(i-1) + isize_map(i-1)
  enddo

  is = isize_map( ipe )
  ifirst = ifirst_map( ipe )
  allocate( a(1:is) )
  a(:) = dble( ipe + 1)

  call mpi_type_create_subarray(1, (/dimx/), (/is/), &
       (/ifirst/), MPI_ORDER_FORTRAN, MPI_DOUBLE_PRECISION, type_file1d, ierr )
  call mpi_type_commit( type_file1d, ierr )

  call mpi_file_open( mpi_comm_world, fileo, MPI_MODE_CREATE + MPI_MODE_WRONLY, MPI_INFO_NULL, handle, ierr )

  if ( ierr == MPI_SUCCESS ) then

    call mpi_file_set_view( handle, 0_MPI_OFFSET_KIND, MPI_DOUBLE_PRECISION, &
                          &  type_file1d, "native", MPI_INFO_NULL, ierr )
    call mpi_file_write_all( handle, a(1), is, MPI_DOUBLE_PRECISION, &
                           & MPI_STATUSES_IGNORE, ierr )
    call mpi_file_close(handle, ierr)

  endif

  if ( ipe == 0 ) then
    deallocate( a )
    allocate( a(dimx) )
    open(10, file=fileo, form='unformatted', access='direct', recl=dimx*8 )
    read(10,rec=1) a
    close(10)
    write(6,'(10i3)') int(a(1:10))
    write(6,'(10i3)') int(a(512-9:512))
    write(6,'(10i3)') int(a(1+512:10+512))
    write(6,'(10i3)') int(a(1024-9:1024))
  endif

  call mpi_finalize( ierr )

end program
