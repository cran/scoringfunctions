serr_sf <- function(x, y)
{
    # The squared error scoring function is defined in Table 1 in Gneiting
    # (2011).
    # 
    # Arguments
    # x: Predictive mean functional (prediction). It can be a vector of length n
    # (must have the same length as y).
    # y: Realization (true value) of process.  It can be a vector of length n
    # (must have the same length as x).
    #
    # Output
    # Squared error (SE). It is negatively oriented and 0 <= SE.
    # The lower its value, the better the mean functional forecast.
    # Each value of the output is the SE corresponding to the respective value
    # of the vectors x, y.
    #
    # References
    # Gneiting T (2011) Making and evaluating point forecasts. Journal of the
    # American Statistical Association 106(494):746-762.
    # https://doi.org/10.1198/jasa.2011.r10138.

    (x - y)^2
}