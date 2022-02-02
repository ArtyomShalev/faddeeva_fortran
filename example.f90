
!    !TODO relerr and cmplx kind dont effect the result

program main
    use faddeeva_fortran_interface
    implicit none
    complex(dp) :: z
    real(dp) :: relerr
    character(:), allocatable :: func_name

    z = cmplx(1.0_dp, 1.0_dp)
    relerr = 1e-13_dp
    func_name = 'Faddeeva_w'
    call example(Faddeeva_w, func_name, z, relerr)
end program main
