gpl1_sf <- function(x, y, p, b)
{
    err <- x^b - y^b
    
    (p * pmax(-err, 0) + (1 - p) * pmax(err, 0))/(abs(b))
}