! -*-F90-*-
!- Make grads dataset of Chouseki Kansoku CD-ROM.
program main
  implicit none

  integer,parameter :: nhour=24, nday=365, lun=10, timezone=9, undef=0
  integer :: i,h(nhour*nday)
  character(100) :: filei,fileo

  namelist /param/ filei, fileo


  !-- arguments --
  read(5,param,iostat=i)
  if (i/=0) then
    write(*,*) 'Error: no namelist'
    stop
  endif
  write(*,*) 'Input :',trim(filei)
  write(*,*) 'Output:',trim(fileo)


  !-- Input --
  open(lun,file=filei,status='old',form='formatted',action='read')
    do i = 1, nday
      read(lun,'(24i3)') h( nhour*(i-1)+1:nhour*i )
    enddo
  close(lun)


  !-- UTC+9 (Japan) to UTC --
  h(1:nhour*nday-timezone) = h(timezone+1:nhour*nday)
  h(nhour*nday-timezone+1:nhour*nday) = undef


  !-- Output --
  open(lun,file=fileo,recl=nhour*nday*4,access='direct',form='unformatted' &
                  & ,action='write')
    write(lun,rec=1) real(h)
  close(lun)


end program main
