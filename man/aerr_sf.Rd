\name{aerr_sf}

\alias{aerr_sf}

\title{
Absolute error scoring function
}

\description{
The function aerr_sf computes the absolute error scoring function when \eqn{y}
materializes and \eqn{x} is the predictive median functional.

The absolute error scoring function is defined in Table 1 in Gneiting (2011).
}

\usage{
aerr_sf(x, y)
}

\arguments{
\item{x}{Predictive median functional (prediction). It can be a vector of length
\eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The absolute error scoring function is defined by:

    \deqn{S(x, y) := |x - y|}

Domain of function:

    \deqn{x \in \R}

    \deqn{y \in \R}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y \in \R}
}

\value{
Vector of absolute errors.
}

\note{
For details on the absolute error scoring function, see Gneiting (2011).

The median functional is the median of the probability distribution \eqn{F} of
\eqn{y} (Gneiting 2011).

The absolute error scoring function is negatively oriented (i.e. the smaller,
the better).

The absolute error scoring function is strictly consistent for the median
functional relative to the family \eqn{\mathbb{F}} of potential probability
distributions \eqn{F} for the future \eqn{y} for which the first moment exists
and is finite (Gneiting 2011).
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.
}

\examples{
# Compute the absolute error scoring function.

df <- data.frame(
    y = rep(x = 0, times = 5),
    x = -2:2
)

df$absolute_error <- aerr_sf(x = df$x, y = df$y)

print(df)
}