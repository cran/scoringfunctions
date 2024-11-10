\name{gpl1_sf}

\alias{gpl1_sf}

\title{
Generalized piecewise linear power scoring function (type 1)
}

\description{
The function gpl1_sf computes the generalized piecewise linear power scoring
function at a specific level \eqn{p} for \eqn{g(x) = x^b/|b|}, \eqn{b > 0}, when
\eqn{y} materializes and \eqn{x} is the predictive quantile at level \eqn{p}.

The generalized piecewise linear power scoring function is defined by eq. (25)
in Gneiting (2011) and the form implemented here for the specific \eqn{g(x)} is
defined by eq. (26) in Gneiting (2011).
}

\usage{
gpl1_sf(x, y, p, b)
}

\arguments{
\item{x}{Predictive quantile (prediction) at level \eqn{p}. It can be a vector
of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{p}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}

\item{b}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The generalized piecewise linear power scoring function (type 1) is defined by:

    \deqn{
        S(x, y, p, b) :=
        (1/|b|) (\textbf{1} \lbrace x \geq y \rbrace - p) (x^b - y^b)
    }

or equivalently

    \deqn{
        S(x, y, p, b) := (1/|b|) (p | \max \lbrace -(x^b - y^b), 0 \rbrace | +
        (1 - p) | \max \lbrace x^b - y^b, 0 \rbrace |)
    }

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}

    \deqn{0 < p < 1}

    \deqn{b > 0}
    
Range of function:

    \deqn{S(x, y, p, b) \geq 0, \forall x, y > 0, p \in (0, 1), b > 0}
}

\value{
Vector of generalized piecewise linear power losses.
}

\note{
The implemented function is denoted as type 1 since it corresponds to a specific
type of \eqn{g(x)} of the general form of the generalized piecewise linear power
scoring function defined by eq. (25) in Gneiting (2011).

For the definition of quantiles, see Koenker and Bassett Jr (1978).

The generalized piecewise linear scoring function is negatively oriented (i.e.
the smaller, the better).

The herein implemented generalized piecewise linear power scoring function is
strictly \eqn{\mathbb{F}}-consistent for the \eqn{p}-quantile functional.
\eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[Y^b]} exists and is finite (Thomson 1979; Saerens 2000;
Gneiting 2011).
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Koenker R, Bassett Jr G (1978) Regression quantiles. \emph{Econometrica}
\bold{46(1)}:33--50. \doi{10.2307/1913643}.

Saerens M (2000) Building cost functions minimizing to some summary statistics.
\emph{IEEE Transactions on Neural Networks} \bold{11(6)}:1263--1271.
\doi{10.1109/72.883416}.

Thomson W (1979) Eliciting production possibilities from a well-informed
manager. \emph{Journal of Economic Theory} \bold{20(3)}:360--380.
\doi{10.1016/0022-0531(79)90042-5}.
}

\examples{
# Compute the generalized piecewise linear scoring function (type 1).

df <- data.frame(
    y = rep(x = 2, times = 6),
    x = c(1, 2, 3, 1, 2, 3),
    p = c(rep(x = 0.05, times = 3), rep(x = 0.95, times = 3)),
    b = rep(x = 2, times = 6)
)

df$gpl1_penalty <- gpl1_sf(x = df$x, y = df$y, p = df$p, b = df$b)

print(df)

# Equivalence of generalized piecewise linear scoring function (type 1) and
# asymmetric piecewise linear scoring function (quantile scoring function), when
# b = 1.

set.seed(12345)

n <- 100

x <- runif(n, 0, 20)
y <- runif(n, 0, 20)
p <- runif(n, 0, 1)
b <- rep(x = 1, times = n)

u <- gpl1_sf(x = x, y = y, p = p, b = b)
v <- quantile_sf(x = x, y = y, p = p)

max(abs(u - v))

# Equivalence of generalized piecewise linear scoring function (type 1) and
# MAE-SD scoring function, when p = 1/2 and b = 1/2.

set.seed(12345)

n <- 100

x <- runif(n, 0, 20)
y <- runif(n, 0, 20)
p <- rep(x = 0.5, times = n)
b <- rep(x = 1/2, times = n)

u <- gpl1_sf(x = x, y = y, p = p, b = b)
v <- maesd_sf(x = x, y = y)

max(abs(u - v))
}