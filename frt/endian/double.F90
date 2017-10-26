program main
  implicit none

  real(8) :: x = 0.d0
  integer(1) :: y1(8)

  x = sqrt( -1.d0 )
  y1 = transfer( x, y1 )

  write(*,*) x
  write(*,*) y1
  write(*,'(z255)') x
  write(*,'(z255)') y1

end program
