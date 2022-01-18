program main
    use faddeeva_fortran_interface
    integer, parameter :: dp=kind(0.d0)
!    complex(dp), allocatable :: z(:)
    complex(dp) :: z
!    complex(dp), allocatable :: result(:)
    complex(dp) :: result
    real(dp) :: relerr
    !=======================================================================
    !FADDEEVA FUNCTION
    !Usage: result = Faddeeva_w(z, relerr)
    !Compute: w(z) = exp(-z*z)*erfc(-i*z)
    !z:  a complex value (not an array)
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

end program
