
program main
  !$ use omp_lib
  implicit none

  integer,parameter :: im = 1000, jm = 100  !- jm=1000: memory over
  real(8)           :: d(im,jm)

  !$omp parallel
  !!$ write(6,*) omp_in_parallel()
  !$ if ( omp_get_thread_num() == 0 ) write(6,*) 'OMP_NUM_THREADS =',omp_get_num_threads()
  !$omp end parallel

  write(6,*) 'start'
  flush(6)

  call test_raw
!  call test_simd_i

contains


subroutine test_raw

  integer :: i, j, k

  do k = 1, 1000

  d(:,:) = 1.d0

  !$omp parallel do private( i, j )
  do j = 2, jm-1
    !!$omp simd
    do i = 2, im-1
      d(i,j) = mod( sum( d(i-1:i+1,j-1:j+1) ), 100.d0 )
    enddo
  enddo
  !$omp end parallel do

  enddo

  write(6,*) d(im-1,jm-1), ( d(im-1,jm-1) ) == 33.d0

end subroutine test_raw


end program main
