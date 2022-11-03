\name{maesd_sf}

\alias{maesd_sf}

\title{
MAE-SD scoring function
}

\description{
The function maesd_sf computes the MAE-SD scoring function when \eqn{y}
materializes and \eqn{x} is the predictive median functional.

The MAE-SD scoring function is defined by eq. (12) in Patton (2011).
}

\usage{
maesd_sf(x, y)
}

\arguments{
\item{x}{Predictive median functional (prediction). It can be a vector of length
\eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The MAE-SD scoring function is defined by:

    \deqn{S(x, y) := |x^{1/2} - y^{1/2}|}

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y > 0}
}

\value{
Vector of MAE-SD losses.
}

\note{
For details on the MAE-SD scoring function, see (Gneiting 2011) and Patton
(2011).

The median functional is the median of the probability distribution \eqn{F} of
\eqn{y} (Gneiting 2011).

The MAE-SD scoring function is negatively oriented (i.e. the smaller, the
better).

The MAE-SD scoring function is strictly consistent for the median functional
relative to the family \eqn{\mathbb{F}} of potential probability distributions
\eqn{F} for the future \eqn{y} for which \eqn{E_F[Y^{1/2}]} exists and is finite
(Gneiting 2011).
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Patton AJ (2011) Volatility forecast comparison using imperfect volatility
proxies. \emph{Journal of Econometrics} \bold{160(1)}:246--256.
\doi{10.1016/j.jeconom.2010.03.034}.
}

\examples{
# Compute the MAE-SD scoring function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3
)

df$mae_sd_penalty <- maesd_sf(x = df$x, y = df$y)

print(df)
}