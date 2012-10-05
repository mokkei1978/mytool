! -*-F90-*-
!- Make grads dataset of Chouseki Kansoku CD-ROM.
!-  Notice!! Data timezone s UTC+9 (Japan)
program main
  implicit none

  integer,parameter :: nhour=24, lun=10
  integer :: i, nday
  integer,allocatable :: h(:)
  character(100) :: filei,fileo

  namelist /param/ filei, fileo, nday

  !-- arguments --
  read(5,param,iostat=i)
  if (i/=0) then
    write(*,*) 'STOP! Error in reading namelist'
    stop
  endif
  write(*,*) 'Input :',trim(filei)
  write(*,*) 'Output:',trim(fileo)

  !-- Input --
  allocate( h(1:nhour*nday) )
  open(lun,file=filei,status='old',form='formatted',action='read')
    do i = 1, nday
      read(lun,'(24i3)') h( nhour*(i-1)+1:nhour*i )
    enddo
  close(lun)

  !-- Output --
  open(lun,file=fileo,recl=nhour*nday*4,access='direct',form='unformatted' &
                  & ,action='write')
    write(lun,rec=1) real(h)
  close(lun)


end program main
