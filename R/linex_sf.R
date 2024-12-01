linex_sf <- function(x, y, a)
{
    exp(a * (x - y)) - a * (x - y) - 1
}