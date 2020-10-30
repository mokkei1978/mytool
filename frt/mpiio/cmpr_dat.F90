! mpiio.dat と root.dat で値が異なるグリッドを探す
program main
  implicit none

  integer,parameter :: dimx = 1024, dimy = 512, dimz = 100

  integer,parameter :: isize = dimx, jsize = dimy, ksize = dimz

  real(8) :: a(isize,jsize,ksize),b(isize,jsize,ksize)
  integer :: i,j,k

  open(10, file='temp/mpiio.dat', form='unformatted', &
       & access='direct', recl=dimx*dimy*dimz*8 )
  read(10,rec=1) a
  close(10)
  open(10, file='temp/root.dat', form='unformatted', &
       & access='direct', recl=dimx*dimy*dimz*8 )
  read(10,rec=1) b
  close(10)

  do k=1,ksize
    do j=1,jsize
      do i=1,isize
        if ( a(i,j,k) /= b(i,j,k) ) write(6,*) i,j,k,a(i,j,k),b(i,j,k)
      enddo
    enddo
  enddo

end program main
