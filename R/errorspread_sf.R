errorspread_sf <- function(x1, x2, x3, y)
{
    err <- x1 - y
    
    (x2 - err^2 - err * sqrt(x2) * x3)^2
}