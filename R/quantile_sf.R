quantile_sf <- function(x, y, p)
{
    err <- x - y

    p * pmax(-err, 0) + (1 - p) * pmax(err, 0)
}