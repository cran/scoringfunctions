\name{serr_sf}

\alias{serr_sf}

\title{
Squared error scoring function
}

\description{
The function serr_sf computes the squared error scoring function when \eqn{y}
materializes and \eqn{x} is the predictive mean functional.

The squared error scoring function is defined in Table 1 in Gneiting (2011).
}

\usage{
serr_sf(x, y)
}

\arguments{
\item{x}{Predictive mean functional (prediction). It can be a vector of length
\eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The squared error scoring function is defined by:

    \deqn{S(x, y) := (x - y)^2}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y \in \mathbb{R}}
}

\value{
Vector of squared errors.
}

\note{
For details on the squared error scoring function, see Savage (1971), Gneiting
(2011).

The mean functional is the mean \eqn{\textnormal{E}_F[Y]} of the probability
distribution \eqn{F} of \eqn{y} (Gneiting 2011).

The squared error scoring function is negatively oriented (i.e. the smaller, the
better).

The squared error scoring function is strictly \eqn{\mathbb{F}}-consistent for
the mean functional. \eqn{\mathbb{F}} is the family of probability distributions
\eqn{F} for which the second moment exists and is finite (Savage 1971;
Gneiting 2011).
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Savage LJ  (1971) Elicitation of personal probabilities and expectations.
\emph{Journal of the American Statistical Association} \bold{66(337)}:783--810.
\doi{10.1080/01621459.1971.10482346}.
}

\examples{
# Compute the squarer error scoring function.

df <- data.frame(
    y = rep(x = 0, times = 5),
    x = -2:2
)

df$squared_error <- serr_sf(x = df$x, y = df$y)

print(df)
}