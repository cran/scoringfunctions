expectile_sf <- function(x, y, p)
{
    err <- x - y

    p * (pmin(err, 0))^2 + (1 - p) * (pmax(err, 0))^2
}