program main
!  use mpi  !- mpi_file_write_all does not match
  implicit none

#include <mpif.h>

!  integer,parameter :: npartx = 32, nparty = 12
  integer,parameter :: npartx = 2, nparty = 2
  integer,parameter :: dimx = 1024, dimy = 512, dimz = 240

  integer,parameter :: mloop = 1

  integer :: type_file2d, type_file3d
  integer :: ierr, npe, ipe

  integer,parameter :: isize = dimx/npartx, jsize = dimy/nparty - 1, ksize = dimz
  integer           :: icoord, jcoord, kcoord

  real(4) :: a(isize,jsize,ksize)

  integer :: handle, i, j, k, m


  call mpi_init( ierr )
  call mpi_comm_size( mpi_comm_world, npe, ierr )
  call mpi_comm_rank( mpi_comm_world, ipe, ierr )

  a(:,:,:) = real( ipe )

  icoord = mod( ipe, npartx )
  jcoord = ipe / npartx
  kcoord = 0

  write(6,*) icoord*isize,jcoord*jsize, kcoord*ksize


  call mpi_type_create_subarray(3, (/dimx,dimy,dimz/),(/isize,jsize,ksize/), &
       (/icoord*isize,jcoord*jsize, kcoord*ksize/), MPI_ORDER_FORTRAN,&
       MPI_REAL, type_file3d, ierr)

  call mpi_type_commit( type_file3d, ierr )

  call mpi_file_open( mpi_comm_world, 'temp/mpiio.dat', MPI_MODE_CREATE + MPI_MODE_WRONLY, MPI_INFO_NULL, handle, ierr )

  if ( ierr == MPI_SUCCESS ) then

    call mpi_file_set_view( handle, 0_MPI_OFFSET_KIND, MPI_REAL, type_file3d, "native", MPI_INFO_NULL, ierr )
    ! 第５引数にエンディアンを指定できる実装もあるようだが、どこでも動くとは限らないため、常に”native”指定
    !出力データをbyte arrayにパック, native_little_endianならエンディアン変換
    !buffer = transfer( a(1:isize, 1:jsize, 1:ksize), buffer )

do m = 1, mloop


    !IF (native_little_endian) THEN
    !DO i=1, isize*jsize*ksize
    !tmp(1:8) = buffer(1:8, i)
    !DO j=1, 8
    !buffer(j,i) = tmp(9-j)
    !END DO
    !END DO
    !END IF

    call mpi_file_write_all( handle, a(1,1,1), isize*jsize*ksize, MPI_REAL, MPI_STATUSES_IGNORE, ierr )

enddo

    call mpi_file_close(handle, ierr)

  else

    write(6,*) "cannot open file"

  endif

  call mpi_finalize( ierr )

end program
