bmedian_sf <- function(x, y, b)
{
    # The b-median scoring function is defined in eq. (4) in Gneiting (2011).
    # 
    # Arguments
    # x: Predictive b-median functional (prediction). It can be a vector of
    # length n (must have the same length as y). x > 0.
    # y: Realization (true value) of process.  It can be a vector of length n
    # (must have the same length as x). y > 0.
    # b: It can be a vector of length n (must have the same length as y). b > 0
    # or b < 0
    #
    # Output
    # b-median loss (BML). It is negatively oriented and 0 <= BML.
    # The lower its value, the better the median functional forecast.
    # Each value of the output is the BML corresponding to the respective value
    # of the vectors x, y.
    #
    # References
    # Gneiting T (2011) Making and evaluating point forecasts. Journal of the
    # American Statistical Association 106(494):746-762.
    # https://doi.org/10.1198/jasa.2011.r10138.

    abs(1 - ((y/x)^b))
}