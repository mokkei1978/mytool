program main
  implicit none
  integer, parameter :: imx = 41, jmx = 23, km = 61
  integer :: imu = imx-2, jmu = jmx-1
  real(8) :: dundef
  real(8) :: atexl(imx,jmx,km) !J TS点の海陸インデックス
  real(8) :: d(imx,jmx,km)
  integer :: i, j, k, l
  real(8) :: cputime, cpu

#ifdef USE_IF
  write(6,*) 'use IF'
#else
#ifdef USE_WHERE
  write(6,*) 'use WHERE'
#else
  write(6,*) 'use mask array'
#endif
#endif

  atexl(:,:,:) = 1.d0
  atexl(imx-2:imx,:,:) = 0.d0
  atexl(:,jmx-2:jmx,:) = 0.d0
  
  do j = 1, jmx
    do i = 1, imx
      d(i,j,:) = dble(i*10+j)
    enddo
  enddo

!  call clock(cputime,0,2)
  do l = 1, 100000
    dundef = dble(l)

#ifdef USE_IF
!OCL NORECURRENCE(d)
    do k = 1, km
      do j = 1, jmu
        do i = 1, imu
          if (atexl(i,j,k) == 0.d0) d(i,j,k) = dundef
        enddo
      enddo
    enddo
#else
#ifdef USE_WHERE
    where (atexl(1:imu,1:jmu,1:km) == 0.d0) d(1:imu,1:jmu,1:km) = dundef

#else
!OCL NORECURRENCE(d)
    do k = 1, km
      do j = 1, jmu
        do i = 1, imu
          d(i,j,k) = d(i,j,k)*atexl(i,j,k) + dundef*( 1.d0-atexl(i,j,k) )
        enddo
      enddo
    enddo

#endif
#endif

  enddo

!  call clock(cpu,0,2)
!  write(6,*) 'time: ',cpu-cputime

  write(6,*) d(imu,jmu,km)
!  open(10, file='test.dat', access='direct', recl=8*imx*jmx)
!  write(10, rec=1) d(:,:,1)
!  close(10)

end program main
