huber_sf <- function(x, y, a)
{
    # The Huber scoring function is defined by Huber (1964)
    # 
    # Arguments
    # x: Predictive Huber mean (prediction). It can be a vector of length n
    # (must have the same length as y).
    # y: Realization (true value) of process. It can be a vector of length n
    # (must have the same length as x).
    # a: It can be a vector of length n (must have the same length as y). 0 < a.
    #
    # Output
    # Huber loss (HL). It is negatively oriented and 0 <= HL.
    # The lower its value, the better the Huber functional forecast.
    # Each value of the output is the HL corresponding to the respective value
    # of the vectors x, y, a.
    #
    # References
    # Huber PJ (1964) Robust Estimation of a Location Parameter. Annals of
    # Mathematical Statistics 35(1):73-101.
    # https://doi.org/10.1214/aoms/1177703732.

    err <- x - y

    cf <- capping_function(t = err, a = a, b = a)

    cf * (err - cf/2)
}