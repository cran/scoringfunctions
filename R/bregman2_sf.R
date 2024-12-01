bregman2_sf <- function(x, y, b)
{
    ((((y^b) - (x^b))/b) - (y - x) * (x^(b - 1)))/(b - 1)
}