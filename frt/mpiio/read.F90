program main
  implicit none

  integer,parameter :: dimx = 1024, dimy = 512, dimz = 240

  integer,parameter :: isize = dimx, jsize = dimy, ksize = dimz

  real(8) :: a(isize,1) !,jsize) !,ksize)
  integer :: k

  open(10, file='temp/mpiio.dat', form='unformatted', &
       & access='direct', recl=dimx*8) !dimy*8 )
  read(10,rec=1) a
  close(10)

  write(6,'(10i3)') int(a(1:10,1))
  write(6,'(10i3)') int(a(512-9:512,1))
  write(6,'(10i3)') int(a(1+512:10+512,1))
  write(6,'(10i3)') int(a(1024-9:1024,1))
!  write(6,'(10i3)') int(a(1025,1))
!  write(6,*) a(1,1+256)
!  write(6,*) a(1+512,1+256)

end program
