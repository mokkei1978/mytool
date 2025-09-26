program sample

!  use linear_equation_of_state
  use nonlinear_equation_of_state
  use profile
  
  type(profile_data):: A, B
  real(4):: x,y
  real(8):: d,t,s
  integer:: k

  open(10,file='A.dat',form='formatted')
  read(10,'(2f8.1)') x,y
  A%lat=x
  A%lon=y
  do k=1,102
     read(10,'(3f7.1)') d,t,s
     if( t == -999. ) exit
     A%depth(k)=d
     A%temp (k)=t
     A%salt (k)=s
     A%dens (k)=eos(A%temp(k),A%salt(k),0.d0)
  end do
  A%num=k-1
  A%station_name = 'Sta. A'

  open(10,file='B.dat',form='formatted')
  read(10,'(2f8.1)') x,y
  B%lat=x
  B%lon=y
  do k=1,102
     read(10,'(3f7.1)') d,t,s
     if( t == -999. ) exit
     B%depth(k)=d
     B%temp (k)=t
     B%salt (k)=s
     B%dens (k)=eos(B%temp(k),B%salt(k),0.d0)
  end do
  B%num=k-1
  B%station_name = 'Sta. B'

  call print_profile(A)
  call print_profile(B)

end program sample
