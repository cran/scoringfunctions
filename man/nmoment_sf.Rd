\name{nmoment_sf}

\alias{nmoment_sf}

\title{
\eqn{n}-th moment scoring function
}

\description{
The function nmoment_sf computes the \eqn{n}-th moment scoring function, when
\eqn{y} materializes, and \eqn{\textnormal{E}_F[Y^n]} is the predictive
\eqn{n}-th moment.

The \eqn{n}-th moment scoring function is defined by eq. (22) in Gneiting (2011)
by setting \eqn{r(t) = t^n}, \eqn{s(t) = 1}, \eqn{\phi(t) = t^2} and removing
all terms that are not functions of \eqn{x}.
}

\usage{
nmoment_sf(x, y, n)
}

\arguments{
\item{x}{Predictive \eqn{n}-th moment. It can be a vector of length \eqn{m}
(must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{m} (must have the same length as \eqn{x}).}

\item{n}{\eqn{n}) is the moment order. It can be a vector of length \eqn{m}
(must have the same length as \eqn{x}).}
}

\details{
The \eqn{n}-th moment scoring function is defined by:

    \deqn{
        S(x, y, n) := -x^2 - 2 x (y^n - x)
    }

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}
    
    \deqn{n \in \mathbb{N}}
}

\value{
Vector of \eqn{n}-th moment losses.
}

\note{
The \eqn{n}-th moment functional is the expectation \eqn{\textnormal{E}_F[Y^n]}
of the probability distribution \eqn{F} of \eqn{y}.

The \eqn{n}-th moment scoring function is negatively oriented (i.e. the smaller,
the better).

The \eqn{n}-th moment scoring function is strictly \eqn{\mathbb{F}}-consistent
for the \eqn{n}-th moment functional \eqn{\textnormal{E}_F[Y^n]}
(Theorem 8 in Gneiting 2011). \eqn{\mathbb{F}} is the family of probability
distributions \eqn{F} for which \eqn{\textnormal{E}_F[Y^]},
\eqn{\textnormal{E}_F[Y^2]}, \eqn{\textnormal{E}_F[Y^n]} and
\eqn{\textnormal{E}_F[Y^{n + 1}]} exist and are finite (Theorem 8 in Gneiting
2011).
}

\references{
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

df$nmoment_penalty <- nmoment_sf(x = df$x, y = df$y, n = df$n)

print(df)
}