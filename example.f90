program main
    use faddeeva_fortran_interface
!    implicit none
    complex(dp) :: z
    real(dp) :: relerr
    character(:), allocatable :: func_name

    z = cmplx(1.0_dp, 1.0_dp)
    relerr = 1e-13_dp
    func_name = 'Faddeeva_w'
    call example(Faddeeva_w, func_name, z, relerr)

    ! -----------------------------------------------------------
    ! FOR DEBUGGING TESTS
!    use faddeeva_fortran_interface, only: Faddeeva_erf
!
!    implicit none
!    integer, parameter :: dp=kind(0.d0)
!    complex(dp), allocatable :: res(:)
!    real(dp) :: relerr, errmax
!    real(dp), allocatable :: re_err(:), im_err(:)
!    integer :: i, num_of_args
!
!    include 'reference_data.f90'
!    relerr = 1e-6_dp
!    errmax = 0
!    num_of_args = size(Faddeeva_erf_args)
!    allocate(res(1:num_of_args))
!    allocate(re_err(1:num_of_args))
!    allocate(im_err(1:num_of_args))
!
!    do i = 1, num_of_args
!        res(i) = Faddeeva_erf(Faddeeva_erf_args(i), relerr)
!        re_err(i) = abs(real(res(i)) - real(Faddeeva_erf_wolfram_refs(i)))/abs(real(Faddeeva_erf_wolfram_refs(i)))
!        im_err(i) = abs(aimag(res(i)) - aimag(Faddeeva_erf_wolfram_refs(i)))/abs(aimag(Faddeeva_erf_wolfram_refs(i)))
!        if (re_err(i) > errmax) errmax = re_err(i)
!        if (im_err(i) > errmax) errmax = im_err(i)
!
!!        if (errmax > 1e-13) then
!        if (errmax > relerr) then
!            print *, "FAILURE -- relative error", errmax, "is too large!"
!            stop 1
!        end if
!    end do

end program main
