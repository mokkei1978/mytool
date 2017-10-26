program main
  implicit none

  integer,parameter :: dbl = selected_real_kind(p=13)
  real(8),parameter :: pi = 3.141592653589793d0

  complex(8) :: cd
  real(8)    :: ad, bd
  complex(4) :: cr
  real(4)    :: ar, br

  ad = 1.0d0 * pi
  bd = 2.0d0 * pi
  ar = 1.0e0 * pi
  br = 2.0e0 * pi

!  cd = cmplx( ad, bd ) - only single precision
  cd = cmplx( ad, bd, dbl )
  cr = cmplx( ar, br )

  write(6,*) dbl
  write(6,*) cd
  write(6,*) real(cd)
  write(6,*) dble(cd)
  write(6,*) aimag(cd)

  write(6,*) cr
  write(6,*) real(cr)
  write(6,*) dble(cr)
  write(6,*) aimag(cr)


end program main
