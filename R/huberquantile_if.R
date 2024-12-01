huberquantile_if <- function(x, y, p, a, b)
{
    (abs(as.numeric(x >= y) - p)) * (capping_function(t = x - y, a = a, b = b))
}