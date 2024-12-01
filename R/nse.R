nse <- function(x, y)
{
    ref_meth <- mean(y)

    1 - mse(x = x, y = y)/mse(x = ref_meth, y = y)
}