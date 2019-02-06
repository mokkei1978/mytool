subroutine fir ( ndata, xin, Npoints, Fc, xout )
!
!  FIR low-pass filter
!
!    ndata  : number of data
!    xin(n) : input signal
!  Npoints  : number of calculated points
!     Fc    : cut-off frequency
!     c()   : filter coefficients
!   xout(n) : filtered signal
!
  integer(kind(1)), intent(in) :: ndata, Npoints
  real(kind(1d0)), intent(in)  :: xin(1:ndata), Fc
  real(kind(1d0)), intent(out) :: xout(1:ndata)
  integer(kind(1)) :: i, j, jj, m
  real(kind(1d0)) :: sum, h1, x
  real(kind(1d0)), parameter :: pi = 2.d0*dacos(0.d0)
  real(kind(1d0)), allocatable :: a(:), c(:), wk(:)
  logical :: l_first=.true.
!
  m = int( Npoints / 2 )
  allocate ( a(0:m), c(-m:m), wk(-m+1:ndata+m) )
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
!
!  Marginal processes
!
  do i = 1, ndata
    wk(i) = xin(i)
  end do
  do i = 1, m
    j = ndata + i
    wk(j) = xin(ndata-i)
  end do
  do i = 1, m
    j = 1 - i
    wk(j) = xin(i+1)
  end do
!
!  Filtered signal
!
  do i = 1, ndata
    sum = 0.0
    do j = -m, m
      sum = sum + c(j) * wk(i+j)
    end do
    xout(i) = sum
  end do
!
! Print coefficients and transfer function
!
return
  if( l_first ) then
     write(*,*) '# *** Filter coefficients ***'
     write(*,*) '# k      c_k               '
     sum = 0.0
     do j = -m, m
        write(*,'(i5,3x,e11.4)') j, c(j)
        sum = sum + c(j)
     end do
     write(*,*)
     write(*,*) '*** sum of coefficients : ', sum
     write(*,*)
     write(*,*) '# *** Transfer function ***'
     write(*,*) '# x        H(f)               '     
     do i = 1, 501
       x = 0.01 * float(i-1)
       write(*,'(f5.2,3x,e11.4)') x, H(x)
     end do
     l_first=.false.
  end if
!
  contains
! ------------------------------------------------------------
  function sgmf(m,i)
!
!   Sigma factor
!
    real(kind(1d0)) :: sgmf, h0
!
    if( i == 0 ) then
       sgmf = 1.d0
    else
       h0 = pi * dble(i) / dble(m+1)
       sgmf = dsin(h0)/h0
    end if
!     
  end function sgmf
! ------------------------------------------------------------
  function H(x)
!
!   Transfer function
!
    real(kind(1d0)) :: H, x, sum
    integer(kind(1)) :: j
!
    sum = 0.d0
    do j = -m, m
      sum = sum + c(j) * dcos( j * x )
    end do
    H = sum
!
  end function H
  !
end subroutine fir
