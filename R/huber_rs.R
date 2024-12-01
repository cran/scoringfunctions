huber_rs <- function(x, y, a)
{
    mean(huber_sf(x = x, y = y, a = a))
}