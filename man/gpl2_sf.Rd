\name{gpl2_sf}

\alias{gpl2_sf}

\title{
Generalized piecewise linear power scoring function (type 2)
}

\description{
The function gpl2_sf computes the generalized piecewise linea power scoring
function at a specific level \eqn{p} for \eqn{g(x) = \log(x)}, when \eqn{y}
materialises and \eqn{x} is the predictive quantile at level \eqn{p}.

The generalized piecewise linear power scoring function is negatively oriented
(i.e. the smaller, the better).

The generalized piecewise linear scoring function is defined by eq. (25) in
Gneiting (2011) and the form implemented here for the specific \eqn{g(x)} is
defined by eq. (26) in Gneiting (2011) for \eqn{b = 0}.
}

\usage{
gpl2_sf(x, y, p)
}

\arguments{
\item{x}{Predictive quantile (prediction) at level \eqn{p}. It can be a vector
of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{p}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The generalized piecewise linear power scoring function (type 2) is defined by:

    \deqn{
        S(x, y, p) := (\textbf{1} \lbrace x \geq y \rbrace - p) \log(x/y)
    }

or equivalently

    \deqn{
        S(x, y, p) := p | \max \lbrace -(\log(x) - \log(y)), 0 \rbrace | +
        (1 - p) | \max \lbrace \log(x) - \log(y), 0 \rbrace |
    }


Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}

    \deqn{0 < p < 1}
    
Range of function:

    \deqn{S(x, y, p) \geq 0, \forall x, y > 0, p \in (0, 1)}
}

\value{
Vector of generalized piecewise linear losses.
}

\note{
The implemented function is denoted as type 2 since it corresponds to a specific
type of \eqn{g(x)} of the general form of the generalized piecewise linear power
scoring function defined by eq. (25) in Gneiting (2011).

For the definition of quantiles, see Koenker and Bassett Jr (1978).

The herein implemented generalized piecewise linear power scoring function is
strictly \eqn{\mathbb{F}}-consistent for the \eqn{p}-quantile functional.
\eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[\log(Y)]} exists and is finite (Thomson 1979; Saerens
2000; Gneiting 2011).
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
# Compute the generalized piecewise linear scoring function (type 2).

df <- data.frame(
    y = rep(x = 2, times = 6),
    x = c(1, 2, 3, 1, 2, 3),
    p = c(rep(x = 0.05, times = 3), rep(x = 0.95, times = 3))
)

df$gpl2_penalty <- gpl2_sf(x = df$x, y = df$y, p = df$p)

print(df)

# The generalized piecewise linear scoring function (type 2) is half the MAE-LOG
# scoring function.

df <- data.frame(
    y = rep(x = 5.5, times = 10),
    x = 1:10,
    p = rep(x = 0.5, times = 10)
)

df$gpl2_penalty <- gpl2_sf(x = df$x, y = df$y, p = df$p)

df$mae_log_penalty <- maelog_sf(x = df$x, y = df$y)

df$ratio <- df$gpl2_penalty/df$mae_log_penalty

print(df)
}