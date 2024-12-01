ghuber_sf <- function(x, y, p, a, b)
{
    f <- function(t, a, b)
    {
        capping_function(t, a, b) * (2 * t - capping_function(t, a, b))
    }

    err <- x - y

    p * f(pmin(err, 0), a, b) + (1 - p) * f(pmax(err, 0), a, b)
}