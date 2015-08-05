program main
  implicit none

  integer,parameter :: im = 43200, jm = 21600
  real(4) :: ri(im,jm)

  integer,parameter :: imo = 4320, jmo = 2160
  real(4) :: ro(imo,jmo)

  integer :: i, j, i0, i1, j0, j1

  open( 10, file='/worka/surakawa/gebco2014_jtopo02/gj-topo30.gr', &
       & form='unformatted', access='direct', recl=4*im )
       !- 4*im*jm is over int4.
  do j = 1, jm
    read( 10, rec=j ) ri(:,j)
  enddo
  close( 10 )

  do j = 1, jmo
    j1 = j * 10
    j0 = (j-1)*10+1
    do i = 1, imo
      i1 = i * 10
      i0 = (i-1)*10+1
      ro(i,j) = sum(ri(i0:i1,j0:j1)) * 1.d-2  !- mean
    enddo
  enddo

  open( 11, file='gj-topo-5min.gd', &
       & form='unformatted', access='direct', recl=4*imo*jmo )
  write( 11, rec=1 ) ro
  close( 11 )

end program main
