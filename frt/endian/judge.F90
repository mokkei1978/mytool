program main
  implicit none

  integer(4) :: x = 1
  integer(1) :: y1(4)
  integer(2) :: y2(2)

  y1 = transfer( x, y1 )
  y2 = transfer( x, y2 )

  write(*,*) x
  write(*,*) y1
  write(*,*) y2
  write(*,'(z255)') x
  write(*,'(z255)') y1
  write(*,'(z255)') y2

end program
