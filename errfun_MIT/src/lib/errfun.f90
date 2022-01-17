module faddeeva_fortran_interface
!    use iso_c_binding

    interface
        complex (c_double_complex) function faddeeva_w(z, relerr) bind(c, name = 'Faddeeva_w')
            use iso_c_binding
            complex(c_double_complex), value :: z
            real(c_double), value :: relerr
        end function faddeeva_w

        complex (c_double_complex) function faddeeva_erf(z, relerr) bind(c, name = 'Faddeeva_erf')
            use iso_c_binding
            complex(c_double_complex), value :: z
            real(c_double), value :: relerr
        end function faddeeva_erf

        complex (c_double_complex) function faddeeva_erfcx(z, relerr) bind(c, name = 'Faddeeva_erfcx')
            use iso_c_binding
            complex(c_double_complex), value :: z
            real(c_double), value :: relerr
        end function faddeeva_erfcx

!        erfc, erfi, Dawson
    end interface
end module faddeeva_fortran_interface
