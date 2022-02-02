program Faddeeva_erf_test
    use faddeeva_fortran_interface, only: Faddeeva_erf
    implicit none
    integer, parameter :: dp=kind(0.d0)
    complex(dp) :: test_args(4), ref_values(4)
    complex(dp) :: z, res
    real(dp) :: relerr, max_relerr

!    do i = 1, len(test_args)
!        res(i) = Faddeeva_erf(z(i))
!    end do

    stop 1

end program Faddeeva_erf_test