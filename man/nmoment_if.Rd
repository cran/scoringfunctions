\name{nmoment_if}

\alias{nmoment_if}

\title{
\eqn{n}-th moment identification function
}

\description{
The function nmoment_if computes the \eqn{n}-th moment identification function,
when \eqn{y} materialises and \eqn{x} is the predictive \eqn{n}-th moment.

The expectile identification function is defined in Table 9 in Gneiting (2011)
by setting \eqn{r(t) = t^n} and \eqn{s(t) = 1}.
}

\usage{
nmoment_if(x, y, n)
}

\arguments{
\item{x}{Predictive \eqn{n}-th moment. It can be a vector of length \eqn{m}
(must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{m} (must have the same length as \eqn{x}).}

\item{n}{\eqn{n}) is the moment order. It can be a vector of length \eqn{m}
(must have the same length as \eqn{x}).}
}

\details{
The \eqn{n}-th moment identification function is defined by:

    \deqn{V(x, y, n) := x - y^n}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}
    
    \deqn{n \in \mathbb{N}}
}

\value{
Vector of values of the \eqn{n}-th moment identification function.
}

\note{
The \eqn{n}-th moment functional is the expectation \eqn{\textnormal{E}_F[Y^n]}
of the probability distribution \eqn{F} of \eqn{y}.

The \eqn{n}-th moment identification function is a strict
\eqn{\mathbb{F}}-identification function for the \eqn{n}-th moment functional
(Gneiting 2011; Fissler and Ziegel 2016).

\eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[Y^n]} exists and is finite (Gneiting 2011; Fissler and
Ziegel 2016).
}

\references{
Fissler T, Ziegel JF (2016) Higher order elicitability and Osband's principle.
\emph{The Annals of Statistics} \bold{44(4)}:1680--1707.
\doi{10.1214/16-AOS1439}.

Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.
}

\examples{
# Compute the n-th moment scoring function.

df <- data.frame(
    y = rep(x = 2, times = 6),
    x = c(1, 2, 3, 1, 2, 3),
    n = c(2, 2, 2, 3, 3, 3)
)

df$nmoment_if <- nmoment_if(x = df$x, y = df$y, n = df$n)

print(df)
}