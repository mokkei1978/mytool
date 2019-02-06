program main
  use tide_killer
  implicit none


  real(8),parameter :: dt_sec = 180.d0  ! MRI.COM-JPN
  real(8),parameter :: period_cutoff_sec = 24.d0 * 3600.d0 !- Q1 tide
  integer,parameter :: im = 2000+270*0
  real(8) :: xin(im), xout !(im)
!  real(8),parameter :: pi = 2.d0*dacos(0.d0)

  real(8) :: tide_freq_radps(8) = (/1.40519D-4, 1.45444D-4, 1.37880D-4, 1.45842D-4, &
                                  & 0.72921D-4, 0.67598D-4, 0.72523D-4, 0.64959D-4/)
  real(8) :: freq_cutoff

  integer :: i, j, npoints, mm, nstep

  npoints = int( period_cutoff_sec / dt_sec ) + 1
  mm = int( period_cutoff_sec*0.5d0 / dt_sec )
  freq_cutoff = dt_sec / period_cutoff_sec

  xin(:) = 0.d0
  do j = 1, 8
    do i = 1, im
      xin(i) = xin(i) + sin( dble(i)*dt_sec*tide_freq_radps(j) )
    enddo
  enddo

!  call fir( im, xin, npoints, freq_cutoff, xout )

  nstep = im - mm
  call tide_killer__register( im, npoints, freq_cutoff, nstep )

  do i = 1, im
    call tide_killer__write( i, xin(i), xout )
enddo
  i = im - mm
  write(6,*) i*dt_sec/3600.d0,xin(i),xout !(i)

!  do i = 1, im
!    write(6,*) i*dt_sec/3600.d0,xin(i),xout(i)
!  enddo

end program main
