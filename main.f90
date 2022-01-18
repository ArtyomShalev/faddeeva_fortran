program main
    use faddeeva_fortran_interface
    integer, parameter :: dp=kind(0.d0)
    complex(dp) :: z_arg, z_res_lib, z_res_multem2
    complex(dp), parameter ::                                                   &
            cone = cmplx( 1.0_dp, 0.0_dp, kind=dp ),                            &
            ci = cmplx( 0.0_dp, 1.0_dp, kind=dp ),                              &
            czero = cmplx( 0.0_dp, 0.0_dp, kind=dp )
    complex(dp) :: result
    real(dp) :: relerr
!    real(dp), parameter:: emach = 1.0d-8, step = 1.0_dp
!    integer i, j
!    integer, parameter:: total =100
!    real(dp), parameter:: start = -step*total, stop = -start
!    real(dp) x,y, z_abs
    !=======================================================================

    write(*,*) 'w'
    result = Faddeeva_w(cone, relerr)
    write(*,*) result
    write(*,*) '-------------------------------------------------------------'

    write(*,*) 'erf'
    result = Faddeeva_erf(cone, relerr)
    write(*,*) result
    write(*,*) '-------------------------------------------------------------'

    write(*,*) 'erfcx'
    res = Faddeeva_erfcx(cone, relerr)
    write(*,*) result
    write(*,*) '-------------------------------------------------------------'
end program
