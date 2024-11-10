\name{quantile_if}

\alias{quantile_if}

\title{
Quantile identification function
}

\description{
The function quantile_if computes the quantile identification function at a
specific level \eqn{p}, when \eqn{y} materializes and \eqn{x} is the predictive
quantile at level \eqn{p}.

The quantile identification function is defined in Table 9 in Gneiting (2011).
}

\usage{
quantile_if(x, y, p)
}

\arguments{
\item{x}{Predictive quantile (prediction) at level \eqn{p}. It can be a vector
of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{p}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The quantile identification function is defined by:

    \deqn{V(x, y, p) := \textbf{1} \lbrace x \geq y \rbrace - p}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{0 < p < 1}

Range of function:

    \deqn{V(x, y, p) \in (-1, 1)}
}

\value{
Vector of values of the quantile identification function.
}

\note{
For the definition of quantiles, see Koenker and Bassett Jr (1978).

The quantile identification function is a strict
\eqn{\mathbb{F}_p}-identification function for the \eqn{p}-quantile functional
(Gneiting 2011; Fissler and Ziegel 2016; Dimitriadis et al. 2024).

\eqn{\mathbb{F}_p} is the family of probability distributions \eqn{F} for which
there exists an \eqn{y} with \eqn{F(y) = p} (Gneiting 2011; Fissler and Ziegel
2016; Dimitriadis et al. 2024).
}

\references{
Dimitriadis T, Fissler T, Ziegel JF (2024) Osband's principle for identification
functions. \emph{Statistical Papers} \bold{65}:1125--1132.
\doi{10.1007/s00362-023-01428-x}.

Fissler T, Ziegel JF (2016) Higher order elicitability and Osband's principle.
\emph{The Annals of Statistics} \bold{44(4)}:1680--1707.
\doi{10.1214/16-AOS1439}.

Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Koenker R, Bassett Jr G (1978) Regression quantiles. \emph{Econometrica}
\bold{46(1)}:33--50. \doi{10.2307/1913643}.
}

\examples{
# Compute the quantile identification function.

df <- data.frame(
    y = rep(x = 0, times = 6),
    x = c(2, 2, -2, -2, 0, 0),
    p = rep(x = c(0.05, 0.95), times = 3)
)

df$quantile_if <- quantile_if(x = df$x, y = df$y, p = df$p)
}