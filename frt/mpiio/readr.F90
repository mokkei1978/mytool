program main
  implicit none

  integer,parameter :: dimx = 1024, dimy = 512, dimz = 240

  real(4) :: a(dimx,dimy,dimz)

  open(10, file='temp/mpiio.dat', form='unformatted', &
      & access='direct', recl=dimx*dimy*dimz*4 )

  read(10,rec=1) a

  close(10)

  write(*,*) a(1,1,1)
  write(*,*) a(1+512,1,1)
  write(*,*) a(1,1+256,1)
  write(*,*) a(1+512,1+256,1)

end program
