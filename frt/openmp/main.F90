program main
!$ use omp_lib
  implicit none

  integer,parameter :: im = 10000, jm = 2000, km = 100
  real(8)           :: d(jm,km)

  integer           :: i, j, k

  !!$ write(6,*) omp_get_num_threads()

  !$omp parallel
  !!$ write(6,*) omp_in_parallel()
  !$ if ( omp_get_thread_num() == 0 ) write(6,*) omp_get_num_threads()
  !$omp end parallel

  d(:,:) = 0.d0

  do k = 1, km
    !$omp parallel do private( &
    !$omp j)
    do j = 1, jm
      call sumi( im, d(j,k) )
    enddo
    !$omp end parallel do
  enddo

  write(6,*) d(jm,km)


  do k = 1, km
    !$omp parallel do private( &
    !$omp i, &
    !$omp j )
    do j = 1, jm
      do i = 1, im
        d(j,k) = d(j,k) + dble(i)
      enddo
    enddo
    !$omp end parallel do
  enddo

end program main



subroutine sumi( im, d )
  implicit none

  integer,intent(in)    :: im
  real(8),intent(inout) :: d

  integer :: i

  do i = 1, im
    d = d + dble(i)
  enddo

end subroutine sumi
