srelerr_sf <- function(x, y)
{
    # The squared relative error scoring function is defined in p. 752 in
    # Gneiting (2011).
    # 
    # Arguments
    # x: Predictive E[Y^2]/E[Y] functional (prediction). It can be a vector of
    # length n (must have the same length as y). x > 0.
    # y: Realization (true value) of process.  It can be a vector of length n
    # (must have the same length as x). y > 0.
    #
    # Output
    # Squared relative error (SRE). It is negatively oriented and 0 <= sRE.
    # The lower its value, the better the E[Y^2]/E[Y] functional forecast.
    # Each value of the output is the SPE corresponding to the respective value
    # of the vectors x, y.
    #
    # References
    # Gneiting T (2011) Making and evaluating point forecasts. Journal of the
    # American Statistical Association 106(494):746-762.
    # https://doi.org/10.1198/jasa.2011.r10138.

    ((x - y)/x)^2
}