quantile_sf <- function(x, y, p)
{
    # The asymmetric piecewise linear scoring function is defined by eq. (24) in
    # Gneiting (2011)
    #
    # Arguments
    # x: Predictive quantile (prediction) at level p. It can be a vector of
    # length n (must have the same length as y).
    # y: Realization of process. It can be a vector of length n (must have the
    # same length as x).
    # p: It can be a vector of length n (must have the same length as y).
    # 0 < p < 1.
    #
    # Output
    # Quantile loss (QL). It is negatively oriented and 0 <= QL.
    # The lower its value, the better the quantile forecast.
    # Each value of the output is the QL corresponding to the respective value
    # of the vectors x, y, p.
    #
    # References
    # Gneiting T (2011) Making and evaluating point forecasts. Journal of the
    # American Statistical Association 106(494):746-762.
    # https://doi.org/10.1198/jasa.2011.r10138
    # Koenker R, Bassett Jr G (1978) Regression quantiles. Econometrica 46(1):
    # 33-50. https://doi.org/10.2307/1913643.

    err <- x - y

    p * pmax(-err, 0) + (1 - p) * pmax(err, 0)
}