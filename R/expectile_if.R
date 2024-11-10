expectile_if <- function(x, y, p)
{
    err <- x - y
    
    2 * (abs((err >= 0) - p)) * (x - y)
}