bregman1_sf <- function(x, y, a)
{
    ((abs(y))^a) - ((abs(x))^a) - a * sign(x) * ((abs(x))^(a - 1)) * (y - x)
}