maesd_sf <- function(x, y)
{
    # The MAE-SD scoring function is defined by eq. (12) in Patton (2011).
    # 
    # Arguments
    # x: Predictive median functional (prediction). It can be a vector of length
    # n (must have the same length as y). x > 0.
    # y: Realization (true value) of process.  It can be a vector of length n
    # (must have the same length as x). y > 0.
    #
    # Output
    # MAE-SD loss (MSL). It is negatively oriented and 0 <= MSL.
    # The lower its value, the better the median functional forecast.
    # Each value of the output is the MSL corresponding to the respective value
    # of the vectors x, y.
    #
    # References
    # Patton AJ (2011) Volatility forecast comparison using imperfect volatility
    # proxies. Journal of Econometrics 160(1):246-256.
    # https://doi.org/10.1016/j.jeconom.2010.03.034.

    abs(sqrt(x) - sqrt(y))
}