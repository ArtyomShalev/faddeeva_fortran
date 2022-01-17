program main
    use faddeeva_fortran_interface
    integer, parameter:: dp=kind(0.d0)
    complex(dp) z_arg, z_res_lib, z_res_multem2
    complex( kind=dp ), parameter ::                                    &
            cone = cmplx( 1.0_dp, 0.0_dp, kind=dp ),                            &
            ci = cmplx( 0.0_dp, 1.0_dp, kind=dp ),                            &
            czero = cmplx( 0.0_dp, 0.0_dp, kind=dp )
    complex(dp) :: res
    real(dp) :: relerr = 1.0e-16_dp
    real(dp), parameter:: emach = 1.0d-8, step = 1.0_dp
    integer i, j
    integer, parameter:: total =100
    real(dp), parameter:: start = -step*total, stop = -start
    real(dp) x,y, z_abs
    !=======================================================================

    write(*,*) 'w'
    res = faddeeva_w(cone, relerr)
    write(*,*) res
    write(*,*) '-------------------------------------------------------------'

    write(*,*) 'erf'
    res = faddeeva_erf(cone, relerr)
    write(*,*) res
    write(*,*) '-------------------------------------------------------------'

    write(*,*) 'erfcx'
    res = faddeeva_erfcx(cone, relerr)
    write(*,*) res
    write(*,*) '-------------------------------------------------------------'
end program
