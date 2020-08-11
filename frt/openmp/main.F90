
program main
  !$ use omp_lib
  implicit none

  integer,parameter :: im = 100000, jm = 2000, km = 100
  real(8)           :: d(jm,km)

  integer           :: i, j, k


  !$omp parallel
  !!$ write(6,*) omp_in_parallel()
  !$ if ( omp_get_thread_num() == 0 ) write(6,*) 'OMP_NUM_THREADS =',omp_get_num_threads()
  !$omp end parallel

  call test_raw
  call test_simd_i

contains


subroutine test_subroutine

  integer :: j, k

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

end subroutine test_subroutine


subroutine test_raw

  integer :: i, j, k

  d(:,:) = 0.d0
  !$omp parallel do private( i, j, k )
  do k = 1, km
    do j = 1, jm
      !$omp simd
      do i = 1, im
        d(j,k) = d(j,k) + dble(i)
      enddo
    enddo
  enddo
  !$omp end parallel do

  write(6,*) d(jm,km)

end subroutine test_raw


subroutine test_simd

  integer :: i, j, k

  d(:,:) = 0.d0
  !$omp parallel do private( i, j, k )
  do k = 1, km
    !$omp simd
    do j = 1, jm
      do i = 1, im
        d(j,k) = d(j,k) + dble(i)
      enddo
    enddo
  enddo
  !$omp end parallel do

  write(6,*) d(jm,km)

end subroutine test_simd


subroutine test_simd_i

  integer :: i, j, k

  d(:,:) = 0.d0
  do i = 1, im
    !$omp parallel do private( j, k )
    do k = 1, km
      !$omp simd
      do j = 1, jm
        d(j,k) = d(j,k) + dble(i)
      enddo
    enddo
    !$omp end parallel do
  enddo

  write(6,*) d(jm,km)

end subroutine test_simd_i


subroutine test_func

  real(8) :: fsum
  integer :: i, j, k

  d(:,:) = 0.d0
  do k = 1, km
    !$omp parallel do private( i, j )
    do j = 1, jm
      do i = 1, im
        d(j,k) = fsum( d(j,k), i )
      enddo
    enddo
    !$omp end parallel do
  enddo

  write(6,*) d(jm,km)

end subroutine test_func


end program main


real(8) function fsum( d, i )
  implicit none

  real(8),intent(in) :: d
  integer,intent(in) :: i

  fsum = d + dble(i)

end function fsum


subroutine sumi( im, d )
  implicit none

  integer,intent(in)    :: im
  real(8),intent(inout) :: d

  integer :: i

  do i = 1, im
    d = d + dble(i)
  enddo

end subroutine sumi
