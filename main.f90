program main
    use faddeeva_fortran_interface
    integer, parameter :: dp=kind(0.d0)
!    complex(dp), allocatable :: z(:)
    complex(dp) :: z
!    complex(dp), allocatable :: result(:)
    complex(dp) :: result
    real(dp) :: relerr

    !=======================================================================
    !THE FADDEEVA FUNCTION
    !Usage: result = Faddeeva_w(z, relerr)
    !Compute: w(z) = exp(-z*z)*erfc(-i*z)
    !z:  a complex value (not an array)
    !-----------------------------------------------------------------------
    !Here is an example of calling this function:
!    allocate(z(1))
!    allocate(result(1))
!    z = ( cmplx(1.0_dp, 0.0_dp, kind=dp), cmplx(5.0_dp, 0.0_dp, kind=dp) )
    !TODO relerr and cmplx kind dont effect the result
    z = cmplx(1.0_dp, 15.0_dp, kind=dp)
!    z = (/ cmplx(1.0_dp, 15.0_dp) /)
!    z(1) = cmplx(1.0_dp, 15.0_dp)
    relerr = 1.0e-14_dp
    result = Faddeeva_w(z, relerr)
    write(*,*) result

    !=======================================================================
    !THE ERROR FUNCTION
    !Usage: result = Faddeeva_erf(z, relerr)
    !Compute: erf(z), the error function
    !z:  a complex value (not an array)
    !-----------------------------------------------------------------------
    !Here is an example of calling this function:
    z = cmplx(1.0_dp, 15.0_dp, kind=dp)
    relerr = 1.0e-14_dp
    result = Faddeeva_erf(z, relerr)
    write(*,*) result

    !=======================================================================
    !THE COMPLEMENTARY ERROR FUNCTION
    !Usage: result = Faddeeva_erfc(z, relerr)
    !Compute: erfc(z) = 1 - erf(z), erf is the error function
    !z:  a complex value (not an array)
    !-----------------------------------------------------------------------
    !Here is an example of calling this function:
    z = cmplx(1.0_dp, 15.0_dp, kind=dp)
    relerr = 1.0e-14_dp
    result = Faddeeva_erfc(z, relerr)
    write(*,*) result

    !=======================================================================
    !THE SCALED COMPLEMENTARY ERROR FUNCTION
    !Usage: result = Faddeeva_erfcx(z, relerr)
    !Compute: erfcx(z) = exp(z*z)*erfc(z), erfc is the complementary error function
    !z:  a complex value (not an array)
    !-----------------------------------------------------------------------
    !Here is an example of calling this function:
    z = cmplx(1.0_dp, 15.0_dp, kind=dp)
    relerr = 1.0e-14_dp
    result = Faddeeva_erfcx(z, relerr)
    write(*,*) result

    !=======================================================================
    !THE IMAGINARY ERROR FUNCTION
    !Usage: result = Faddeeva_erfi(z, relerr)
    !Compute: erfi(z) = -i*erf(i*z), erf is the error function
    !z:  a complex value (not an array)
    !-----------------------------------------------------------------------
    !Here is an example of calling this function:
    z = cmplx(1.0_dp, 15.0_dp, kind=dp)
    relerr = 1.0e-14_dp
    result = Faddeeva_erfi(z, relerr)
    write(*,*) result

    !THE DAWSON FUNCTION
    !Usage: result = Faddeeva_dawson(z, relerr)
    !Compute: Dawson(z) = sqrt(pi)/2*exp(-z*z)*erfi(z), erfi is the imaginary error function
    !z:  a complex value (not an array)
    !-----------------------------------------------------------------------
    !Here is an example of calling this function:
    z = cmplx(1.0_dp, 15.0_dp, kind=dp)
    relerr = 1.0e-14_dp
    result = Faddeeva_dawson(z, relerr)
    write(*,*) result

end program
