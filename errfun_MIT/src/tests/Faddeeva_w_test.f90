program Faddeeva_w_test
    use faddeeva_fortran_interface, only: Faddeeva_w, find_relerr, dp
    ! -----------------------------------------------------------------------
    implicit none
    complex(dp), allocatable :: res(:)
    real(dp), allocatable :: re_err(:), im_err(:)
    real(dp) :: relerr, errmax
    integer :: i, num_args
    include '../../../reference_data.f90'
    ! -----------------------------------------------------------------------
    num_args = size(Faddeeva_w_args)
    allocate(res(1:num_args))
    allocate(re_err(1:num_args))
    allocate(im_err(1:num_args))
    relerr = 0.0_dp
    errmax = 0
    do i = 1, num_args
        res(i) = Faddeeva_w(Faddeeva_w_args(i), relerr)
        re_err(i) = find_relerr(real(res(i)), real(Faddeeva_w_wolfram_refs(i)))
        im_err(i) = find_relerr(aimag(res(i)), aimag(Faddeeva_w_wolfram_refs(i)))
        if (re_err(i) > errmax) errmax = re_err(i)
        if (im_err(i) > errmax) errmax = im_err(i)
        if (errmax > 1e-13) then
            print *, "FAILURE -- relative error", errmax, "is too large!"
            stop 1
        end if
    end do
end program Faddeeva_w_test