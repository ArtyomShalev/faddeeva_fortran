program main
    use faddeeva_fortran_interface
!    implicit none

    complex(dp) :: z
    real(dp) :: relerr
    character(:), allocatable :: func_name
!    include 'reference_data.f90'

    z = cmplx(1.0_dp, 1.0_dp)
    relerr = 1e-13_dp
    func_name = 'Faddeeva_w'
    print *, Faddeeva_erf_args
!    call example(Faddeeva_w, func_name, z, relerr)

end program main
