program main
    use faddeeva_fortran_interface
    implicit none

    complex(dp) :: z
    real(dp) :: relerr
    character(len=16) :: func_name

    interface
        function func(z, relerr)
            use iso_c_binding
            complex(c_double_complex), value :: z
            real(c_double), value :: relerr
            complex(c_double_complex) :: func
        end function
    end interface

    procedure (func), pointer :: f_ptr => null()

    z = cmplx(1.0_dp, 1.0_dp, dp)
    relerr = 0.0_dp
    func_name = 'Faddeeva_erf'
    f_ptr => Faddeeva_erf

    call example(f_ptr, func_name, z, relerr)

end program main

