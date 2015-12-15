program main
  use mpi
  implicit none

!#include <mpif.h>

  integer,parameter :: npartx = 2, nparty = 2
  integer,parameter :: dimx = 1024, dimy = 512, dimz = 240

  integer :: type_file2d, type_file3d
  integer :: ierr, npe, ipe

  integer,parameter :: isize = dimx/npartx, jsize = dimy/nparty, ksize = dimz
  integer           :: icoord, jcoord, kcoord

  real(8) :: a(isize,jsize,ksize)

  integer :: handle, i, j, k
  integer(1) :: buffer(8,isize*jsize*ksize)
  integer(1) :: tmp(8)


  call mpi_init( ierr )
  call mpi_comm_size( mpi_comm_world, npe, ierr )
  call mpi_comm_rank( mpi_comm_world, ipe, ierr )

!  a(:,:,:) = dble( ipe )
  a(:,:,:) = 0.d0

  icoord = mod( ipe, npartx )
  jcoord = ipe / npartx
  kcoord = 0

!  write(6,*) ipe,icoord,jcoord

  call mpi_type_create_subarray(2, (/dimx*8, dimy/), (/isize*8,jsize/), &
       (/icoord*isize*8, jcoord*jsize/), MPI_ORDER_FORTRAN, &
       MPI_BYTE, type_file2d, ierr )

  call mpi_type_create_subarray(3, (/dimx*8,dimy,dimz/),(/isize*8,jsize,ksize/), &
       (/icoord*isize*8,jcoord*jsize, kcoord*ksize/), MPI_ORDER_FORTRAN,&
       MPI_BYTE, type_file3d, ierr)

  call mpi_type_commit( type_file2d, ierr )
  call mpi_type_commit( type_file3d, ierr )

  call mpi_file_open( mpi_comm_world, 'temp/mpiio.dat', MPI_MODE_CREATE + MPI_MODE_WRONLY, MPI_INFO_NULL, handle, ierr )

  if ( ierr == MPI_SUCCESS ) then

    call mpi_file_set_view( handle, 0_MPI_OFFSET_KIND, MPI_BYTE, type_file3d, "native", MPI_INFO_NULL, ierr )
    ! 第５引数にエンディアンを指定できる実装もあるようだが、どこでも動くとは限らないため、常に”native”指定
    !出力データをbyte arrayにパック, native_little_endianならエンディアン変換
    !buffer = transfer( a(1:isize, 1:jsize, 1:ksize), buffer )

    do k = 1, ksize
      do j = 1, jsize
        do i = 1, isize
          buffer(:,i+(j-1)*isize+(k-1)*isize*jsize) = transfer( a(i,j,k), tmp )
        enddo
      enddo
    enddo

    !IF (native_little_endian) THEN
    !DO i=1, isize*jsize*ksize
    !tmp(1:8) = buffer(1:8, i)
    !DO j=1, 8
    !buffer(j,i) = tmp(9-j)
    !END DO
    !END DO
    !END IF

    call mpi_file_write_all( handle, buffer(1,1), isize*jsize*ksize*8, MPI_BYTE, MPI_STATUSES_IGNORE, ierr )
!    write(6,*) 'write 1:',ipe

!    call mpi_file_write_all( handle, buffer(1,1), isize*jsize*ksize*8, MPI_BYTE, MPI_STATUSES_IGNORE, ierr )
!    write(6,*) 'write 2:',ipe

    call mpi_file_close(handle, ierr)

  else

    PRINT "cannot open file"

  endif

  call mpi_finalize( ierr )

end program
