\name{serrpower_sf}

\alias{serrpower_sf}

\title{
Squared error of power transformations scoring function
}

\description{
The function serrpower_sf computes the squared error of power transformations
scoring function when \eqn{y} materialises and \eqn{x} is the
\eqn{(\textnormal{E}_F[Y^a])^{(1/a)}} predictive functional.

The squared error of power transformations scoring function is defined in
Tyralis and Papacharalampous (2025).
}

\usage{
serrpower_sf(x, y, a)
}

\arguments{
\item{x}{Predictive \eqn{(\textnormal{E}_F[Y^a])^{(1/a)}} functional
(prediction). It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{a}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The squared error of power transformations scoring function is defined by:

    \deqn{S(x, y) := (x^a - y^a)^2}

Domain of function:

Case #1

    \deqn{a > 0}

    \deqn{x \geq 0}

    \deqn{y \geq 0}

Case #2

    \deqn{a \neq 0}

    \deqn{x > 0}

    \deqn{y > 0}

Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y, a }
}

\value{
Vector of squared errors of power-transformed variables.
}

\note{
For details on the squared error of power tranformations scoring function, see
Tyralis and Papacharalampous (2025).

The squared error of power tranformations scoring function is negatively
oriented (i.e. the smaller, the better).

The squared error of power transformations scoring function is strictly
\eqn{\mathbb{F}}-consistent for the \eqn{(\textnormal{E}_F[Y^a])^{(1/a)}}
functional. \eqn{\mathbb{F}} is the family of probability distributions \eqn{F}
for which \eqn{\textnormal{E}_F[Y^a]} exists and is finite (Tyralis and
Papacharalampous 2025).
}

\references{
Tyralis H, Papacharalampous G (2025) Transformations of predictions and
realizations in consistent scoring functions. \doi{10.48550/arXiv.2502.16542}.
}

\examples{
# Compute the squarer error of power tranformations scoring function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3,
    a = 1:3
)

df$squaredpower_error <- serrpower_sf(x = df$x, y = df$y, a = df$a)

print(df)
}