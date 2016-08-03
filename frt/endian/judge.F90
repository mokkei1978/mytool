program main
  implicit none

  integer(4) :: x = 1
!  integer(1) :: y(4)
  integer(2) :: y(2)

  y = transfer( x, y )

  write(*,*) x
  write(*,*) y

end program
