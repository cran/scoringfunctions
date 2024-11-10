ghuber_sf <- function(x, y, p, a, b)
{
    # The generalized Huber scoring function is defined by eq. (4.7) in
    # Taggart (2011) for f(t) = t^2.
    # 
    # Arguments
    # x: Predictive Huber functional (prediction) at level p. It can be a vector
    # of length n (must have the same length as y).
    # y: Realization (true value) of process. It can be a vector of length n
    # (must have the same length as x).
    # p: It can be a vector of length n (must have the same length as y).
    # 0 < p < 1.
    # a: It can be a vector of length n (must have the same length as y). 0 < a.
    # b: It can be a vector of length n (must have the same length as y). 0 < b.
    #
    # Output
    # Generalized Huber loss (GHL). It is negatively oriented and 0 <= GHL.
    # The lower its value, the better the Huber functional forecast.
    # Each value of the output is the GHL corresponding to the respective value
    # of the vectors x, y, p, a, b.
    #
    # References
    # Taggart RJ (2022) Point forecasting and forecast evaluation with
    # generalized Huber loss. Electronic Journal of Statistics 16:201-231.
    # https://doi.org/10.1214/21-EJS1957.

    f <- function(t, a, b)
    {
        capping_function(t, a, b) * (2 * t - capping_function(t, a, b))
    }

    err <- x - y

    p * f(pmin(err, 0), a, b) + (1 - p) * f(pmax(err, 0), a, b)
}