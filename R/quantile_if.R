quantile_if <- function(x, y, p)
{
    as.numeric(x >= y) - p
}