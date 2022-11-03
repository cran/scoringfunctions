capping_function <- function(t, a, b)
{
    # The capping function is defined in Taggart (2022), p.205.
    # 
    # Arguments
    # t: It can be a vector of length n.
    # a: It can be a vector of length n (must have the same length as t).
    # 0 <= a.
    # b: It can be a vector of length n (must have the same length as t).
    # 0 <= b.
    #
    # Output
    # Value of the capping function at t, a, b.
    #
    # References
    # Taggart RJ (2022) Point forecasting and forecast evaluation with
    # generalized Huber loss. Electronic Journal of Statistics 16:201-231.
    # https://doi.org/10.1214/21-EJS1957.

    pmax(pmin(t, b), -a)
}