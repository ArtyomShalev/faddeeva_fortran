module faddeeva_fortran_interface
!    use iso_c_binding
    interface
        complex (c_double_complex) function Faddeeva_w(z, relerr) bind(c, name = 'Faddeeva_w')
            use iso_c_binding
            complex(c_double_complex), value :: z
            real(c_double), value :: relerr
        end function Faddeeva_w

        complex (c_double_complex) function Faddeeva_erf(z, relerr) bind(c, name = 'Faddeeva_erf')
            use iso_c_binding
            complex(c_double_complex), value :: z
            real(c_double), value :: relerr
        end function Faddeeva_erf

        complex (c_double_complex) function Faddeeva_erfc(z, relerr) bind(c, name = 'Faddeeva_erfc')
            use iso_c_binding
            complex(c_double_complex), value :: z
            real(c_double), value :: relerr
        end function Faddeeva_erfc

        complex (c_double_complex) function Faddeeva_erfcx(z, relerr) bind(c, name = 'Faddeeva_erfcx')
            use iso_c_binding
            complex(c_double_complex), value :: z
            real(c_double), value :: relerr
        end function Faddeeva_erfcx

        complex (c_double_complex) function Faddeeva_erfi(z, relerr) bind(c, name = 'Faddeeva_erfi')
            use iso_c_binding
            complex(c_double_complex), value :: z
            real(c_double), value :: relerr
        end function Faddeeva_erfi

        complex (c_double_complex) function Faddeeva_dawson(z, relerr) bind(c, name = 'Faddeeva_Dawson')
            use iso_c_binding
            complex(c_double_complex), value :: z
            real(c_double), value :: relerr
        end function Faddeeva_dawson
    end interface
end module faddeeva_fortran_interface
