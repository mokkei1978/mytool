module profile

  implicit none
  private ! 標準でprivate属性とする
          ! （変数はこのモジュールでのみ参照可能）
  public profile_data, print_profile
          ! profile_dataとprint_profileのみpublic属性を与える
          ! （profile_dataとprint_profileはこのモジュールを
          !    呼び出す親プログラムで参照可能）

  type profile_data ! profile_dataという名前の型の定義
     character(8):: station_name
     integer:: num
     real(4):: lat,lon
     real(8),dimension(102):: depth,temp,salt,dens
  end type profile_data

contains ! 内部プログラム

  subroutine print_profile(D)

    type(profile_data):: D
    integer:: k
    
    write(6,*) 'Station : ',D%station_name
    write(6,*) 'Profile Num = ',D%num

    do k=1,D%num
       write(6,'(4f7.1)') D%depth(k),D%temp(k),D%salt(k),D%dens(k)
    end do

  end subroutine print_profile

end module profile
