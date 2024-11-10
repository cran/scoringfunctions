interval_sf <- function(x1, x2, y, p)
{
    err1 <- x1 - y
    err2 <- x2 - y
    p1 <- p/2
    p2 <- 1 - (p/2)

    (2/p) * (((p1) * pmax(-err1, 0) + (p2) * pmax(err1, 0)) +
        ((p2) * pmax(-err2, 0) + (p1) * pmax(err2, 0)))
}