\name{relerr_sf}

\alias{relerr_sf}

\title{
Relative error scoring function (MAE-PROP scoring function)
}

\description{
The function relerr_sf computes the relative error scoring function when \eqn{y}
materialises and \eqn{x} is the predictive \eqn{\textnormal{med}^{(1)}(F)}
functional.

The relative error scoring function is defined in Table 1 in Gneiting (2011).

The relative error scoring function is referred to as MAE-PROP scoring function
in eq. (13) in Patton (2011).
}

\usage{
relerr_sf(x, y)
}

\arguments{
\item{x}{Predictive \eqn{\textnormal{med}^{(1)}(F)} functional (prediction). It
can be a vector of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The relative error scoring function is defined by:

    \deqn{S(x, y) := |(x - y)/x|}

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y > 0}
}

\value{
Vector of relative errors.
}

\note{
For details on the relative error scoring function, see Gneiting (2011).

The \eqn{\beta}-median functional, \eqn{\textnormal{med}^{(\beta)}(F)} is the
median of a probability distribution whose density is proportional to
\eqn{y^\beta f(y)}, where \eqn{f} is the density of the probability distribution
\eqn{F} of \eqn{y} (Gneiting 2011).

The relative error scoring function is negatively oriented (i.e. the smaller,
the better).

The relative error scoring function is strictly \eqn{\mathbb{F}^{(w)}}-consistent for the
\eqn{\textnormal{med}^{(1)}(F)} functional. \eqn{\mathbb{F}} is the family of
probability distributions for which \eqn{\textnormal{E}_F[Y]} exists and is
finite. \eqn{\mathbb{F}^{(w)}} is the subclass of probability distributions in
\eqn{\mathbb{F}}, which are such that \eqn{w(y) f(y)}, \eqn{w(y) = y} has finite
integral over \eqn{(0, \infty)}, and the probability distribution \eqn{F^{(w)}}
with density proportional to \eqn{w(y) f(y)} belongs to \eqn{\mathbb{F}} (see
Theorems 5 and 9 in Gneiting 2011)
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
# Compute the relative error scoring function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3
)

df$relative_error <- relerr_sf(x = df$x, y = df$y)

print(df)
}