bregman1_sf <- function(x, y, a)
{
    # The herein implemented type of Bregman scoring function is defined by
    # eq. (19) in Gneiting (2011) for a > 1.
    # Bregman functions are defined by eq. (18) in Gneiting (2011) and by
    # Banerjee et al. (2005)
    # 
    # Arguments
    # x: Predictive mean functional (prediction). It can be a vector of length n
    # (must have the same length as y).
    # y: Realization (true value) of process.  It can be a vector of length n
    # (must have the same length as x).
    # a: It can be a vector of length n (must have the same length as y). 1 < a.
    #
    # Output
    # Bregman loss (BL). It is negatively oriented and 0 <= BL.
    # The lower its value, the better the mean functional forecast.
    # Each value of the output is the BL corresponding to the respective value
    # of the vectors x, y, a.
    #
    # References
    # Banerjee A, Guo X, Wang H (2005) On the optimality of conditional
    # expectation as a Bregman predictor. IEEE Transactions on Information
    # Theory 51(7):2664-2669. https://doi.org/10.1109/TIT.2005.850145.
    # Gneiting T (2011) Making and evaluating point forecasts. Journal of the
    # American Statistical Association 106(494):746-762.
    # https://doi.org/10.1198/jasa.2011.r10138.

    ((abs(y))^a) - ((abs(x))^a) - a * sign(x) * ((abs(x))^(a - 1)) * (y - x)
}