mv_if <- function(x1, x2, y)
{
    cbind((x1 - y), (x2 + x1^2 - y))
}