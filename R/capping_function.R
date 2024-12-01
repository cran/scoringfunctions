capping_function <- function(t, a, b)
{
    pmax(pmin(t, b), -a)
}