expectile_sf <- function(x, y, p)
{
    # The asymmetric piecewise quadratic scoring function is defined by eq. (27)
    # in Gneiting (2011)
    # 
    # Arguments
    # x: Predictive expectile (prediction) at level p. It can be a vector of
    # length n (must have the same length as y).
    # y: Realization (true value) of process. It can be a vector of length n
    # (must have the same length as x).
    # p: It can be a vector of length n (must have the same length as y).
    # 0 < p < 1.
    #
    # Output
    # Expectile loss (EL). It is negatively oriented and 0 <= EL.
    # The lower its value, the better the expectile forecast.
    # Each value of the output is the EL corresponding to the respective value
    # of the vectors x, y, p.
    #
    # References
    # Gneiting T (2011) Making and evaluating point forecasts. Journal of the
    # American Statistical Association 106(494):746-762.
    # https://doi.org/10.1198/jasa.2011.r10138.
    # Newey WK, Powell JL (1987) Asymmetric least squares estimation and
    # testing. Econometrica 55(4):819-847. https://doi.org/10.2307/1911031.

    err <- x - y

    p * (pmin(err, 0))^2 + (1 - p) * (pmax(err, 0))^2
}