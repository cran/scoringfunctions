lqquantile_sf <- function(x, y, p, q)
{
    err <- x - y

    p * (abs(pmin(err, 0)))^q + (1 - p) * (abs(pmax(err, 0)))^q
}