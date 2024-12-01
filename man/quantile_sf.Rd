\name{quantile_sf}

\alias{quantile_sf}

\title{
Asymmetric piecewise linear scoring function (quantile scoring function,
quantile loss function)
}

\description{
The function quantile_sf computes the asymmetric piecewise linear scoring
function (quantile scoring function) at a specific level \eqn{p}, when \eqn{y}
materialises and \eqn{x} is the predictive quantile at level \eqn{p}.

The asymmetric piecewise linear scoring function is defined by eq. (24) in
Gneiting (2011).
}

\usage{
quantile_sf(x, y, p)
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
The assymetric piecewise linear scoring function is defined by:

    \deqn{S(x, y, p) := (\textbf{1} \lbrace x \geq y \rbrace - p) (x - y)}

or equivalently,

    \deqn{
        S(x, y, p) := p | \max \lbrace -(x - y), 0 \rbrace | +
        (1 - p) | \max \lbrace x - y, 0 \rbrace |
    }

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{0 < p < 1}

Range of function:

    \deqn{S(x, y, p) \geq 0, \forall x, y \in \mathbb{R}, p \in (0, 1)}
}

\value{
Vector of quantile losses.
}

\note{
For the definition of quantiles, see Koenker and Bassett Jr (1978).

The asymmetric piecewise linear scoring function is negatively oriented (i.e.
the smaller, the better).

The asymmetric piecewise linear scoring function is strictly
\eqn{\mathbb{F}}-consistent for the \eqn{p}-quantile functional.
\eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[Y]} exists and is finite (Schlaifer 1961, p.196; Ferguson
1967, p.51; Thomson 1979; Saerens 2000; Gneiting 2011).
}

\references{
Ferguson TS (1967) Mathematical Statistics: A Decision-Theoretic Approach.
Academic Press, New York.

Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Koenker R, Bassett Jr G (1978) Regression quantiles. \emph{Econometrica}
\bold{46(1)}:33--50. \doi{10.2307/1913643}.

Raiffa H,Schlaifer R (1961) Applied Statistical Decision Theory. Colonial Press,
Clinton.

Saerens M (2000) Building cost functions minimizing to some summary statistics.
\emph{IEEE Transactions on Neural Networks} \bold{11(6)}:1263--1271.
\doi{10.1109/72.883416}.

Thomson W (1979) Eliciting production possibilities from a well-informed
manager. \emph{Journal of Economic Theory} \bold{20(3)}:360--380.
\doi{10.1016/0022-0531(79)90042-5}.
}

\examples{
# Compute the asymmetric piecewise linear scoring function (quantile scoring
# function).

df <- data.frame(
    y = rep(x = 0, times = 6),
    x = c(2, 2, -2, -2, 0, 0),
    p = rep(x = c(0.05, 0.95), times = 3)
)

df$quantile_penalty <- quantile_sf(x = df$x, y = df$y, p = df$p)

print(df)

# The absolute error scoring function is twice the asymmetric piecewise linear
# scoring function (quantile scoring function) at level p = 0.5.

df <- data.frame(
    y = rep(x = 0, times = 3),
    x = c(-2, 0, 2),
    p = rep(x = c(0.5), times = 3)
)

df$quantile_penalty <- quantile_sf(x = df$x, y = df$y, p = df$p)

df$absolute_error <- aerr_sf(x = df$x, y = df$y)

print(df)
}