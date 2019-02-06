
subroutine print_hello_for_c() bind(C, name="print_hello")
  use ISO_C_binding
  implicit none
  !DEC$ ATTRIBUTES DLLEXPORT :: print_hello_for_c

  print *, "hello world in fortran"

end subroutine print_hello_for_c
