quantile_rs <- function(x, y, p)
{
    mean(quantile_sf(x = x, y = y, p = p))
}