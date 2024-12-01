huber_sf <- function(x, y, a)
{
    err <- x - y

    cf <- capping_function(t = err, a = a, b = a)

    cf * (err - cf/2)
}