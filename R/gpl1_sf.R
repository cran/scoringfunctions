gpl1_sf <- function(x, y, p, b)
{
    # The herein implemented type of generalized piecewise linear scoring
    # function is defined by eq. (26) in Gneiting (2011) for b > 0.
    # The generalized piecewise linear scoring function is defined by eq. (25)
    # in Gneiting (2011).
    #
    # Arguments
    # x: Predictive quantile (prediction) at level p. It can be a vector of
    # length n (must have the same length as y). x > 0.
    # y: Realization of process. It can be a vector of length n (must have the
    # same length as x). y > 0.
    # p: It can be a vector of length n (must have the same length as y).
    # 0 < p < 1.
    # b: It can be a vector of length n (must have the same length as y). b > 0.
    #
    # Output
    # Generalized piecewise linear loss (GPLL). It is negatively oriented and
    # 0 <= GPLL.
    # The lower its value, the better the quantile forecast.
    # Each value of the output is the GPLL corresponding to the respective value
    # of the vectors x, y, p, b.
    #
    # References
    # Gneiting T (2011) Making and evaluating point forecasts. Journal of the
    # American Statistical Association 106(494):746-762.
    # https://doi.org/10.1198/jasa.2011.r10138
    # Koenker R, Bassett Jr G (1978) Regression quantiles. Econometrica 46(1):
    # 33-50. https://doi.org/10.2307/1913643.

    err <- x^b - y^b
    
    (p * pmax(-err, 0) + (1 - p) * pmax(err, 0))/(abs(b))
}