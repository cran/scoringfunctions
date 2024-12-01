\name{obsweighted_sf}

\alias{obsweighted_sf}

\title{
Observation-weighted scoring function
}

\description{
The function obsweighted_sf computes the observation-weighted scoring function
when \eqn{y} materialises and \eqn{x} is the predictive
\eqn{\dfrac{\textnormal{E}_F [Y^{2}]}{\textnormal{E}_F [Y]}} functional.

The observation-weighted scoring function is defined in p. 752 in
Gneiting (2011).
}

\usage{
obsweighted_sf(x, y)
}

\arguments{
\item{x}{Predictive \eqn{\dfrac{\textnormal{E}_F [Y^{2}]}{\textnormal{E}_F [Y]}}
functional (prediction). It can be a vector of length \eqn{n} (must have the
same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The observation-weighted scoring function is defined by:

    \deqn{S(x, y) := y (x - y)^{2}}

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y > 0}
}

\value{
Vector of observation-weighted errors.
}

\note{
For details on the observation-weighted scoring function, see Gneiting (2011).

The observation-weighted scoring function is negatively oriented (i.e. the
smaller, the better).

The observation-weighted scoring function is strictly consistent for the
\eqn{\dfrac{\textnormal{E}_F [Y^{2}]}{\textnormal{E}_F [Y]}} functional.
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.
}

\examples{
# Compute the observation-weighted scoring function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3
)

df$squared_relative_error <- obsweighted_sf(x = df$x, y = df$y)

print(df)
}