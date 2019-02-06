module tide_killer
  implicit none


  real(kind(1d0)), allocatable,save :: c(:)
  real(kind(1d0)), parameter :: pi = 2.d0*dacos(0.d0)
  integer(kind(1)),save :: m, nstep_out, nstep_first, nstep_last
  real(kind(1d0)),save :: sum

contains


subroutine tide_killer__register( ndata, Npoints, Fc, n )

  integer(kind(1)), intent(in) :: ndata, Npoints, n
  real(kind(1d0)), intent(in)  :: Fc
  integer(kind(1)) :: i, j, jj
  real(kind(1d0)) :: h1, x
  real(kind(1d0)), allocatable :: a(:)
!
  m = int( Npoints / 2 )
  nstep_out = n
  nstep_first = n-m
  nstep_last = n+m
  allocate ( a(0:m), c(-m:m) )
!
!  Coefficients of Fourier series with a sigma factor
!
  a(0) = 2.d0*Fc
  do i = 1, m
     h1 = pi * dble(i)
     a(i) = sgmf(m,i) * dsin(2.d0*Fc*h1)/h1
  end do
!
!  Calculate weight of the filter
!
  sum = 0.0
  do j = -m, m
    jj = iabs(j)
    sum = sum + a(jj)
  end do
  do j = -m, m
    jj = iabs(j)
    c(j) = a(jj) / sum
  end do

  deallocate( a )
  
    sum = 0.d0

end subroutine tide_killer__register


subroutine tide_killer__write( n, xin, xout )
!
  integer(kind(1)), intent(in) :: n
  real(kind(1d0)), intent(in)  :: xin
  real(kind(1d0)), intent(out) :: xout

  integer(kind(1)) :: i, j, jj

  if ( ( n < nstep_first ).or.( n > nstep_last ) ) return
  sum = sum + c(n - nstep_out) * xin

  xout = sum

end subroutine tide_killer__write

! ------------------------------------------------------------
  real(8) function sgmf(mm,i)
!
!   Sigma factor
!
    integer(kind(1)),intent(in) :: i, mm

    real(kind(1d0)) :: h0
!
    if( i == 0 ) then
       sgmf = 1.d0
    else
       h0 = pi * dble(i) / dble(mm+1)
       sgmf = dsin(h0)/h0
    end if
!     
  end function sgmf
! ------------------------------------------------------------
  real(8) function H(x)
!
!   Transfer function
!
    real(kind(1d0)) :: x, sum
    integer(kind(1)) :: j
!
    sum = 0.d0
    do j = -m, m
      sum = sum + c(j) * dcos( j * x )
    end do
    H = sum
!
  end function H

  
end module tide_killer
