gpl2_sf <- function(x, y, p)
{
    err <- log(x) - log(y)
    
    (p * pmax(-err, 0) + (1 - p) * pmax(err, 0))
}