quantile_level <- function(x, y)
{
    mean(as.numeric(x >= y))
}