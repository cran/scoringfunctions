\name{bmedian_sf}

\alias{bmedian_sf}

\title{
\eqn{\beta}-median scoring function
}

\description{
The function bmedian_sf computes the \eqn{\beta}-median scoring function
when \eqn{y} materializes and \eqn{x} is the predictive
\eqn{\textnormal{med}^{(\beta)}(F)} functional.

The \eqn{\beta}-median scoring function is defined in eq. (4) in Gneiting
(2011).
}

\usage{
bmedian_sf(x, y, b)
}

\arguments{
\item{x}{Predictive \eqn{\textnormal{med}^{(\beta)}(F)} functional (prediction).
It can be a vector of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{b}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The \eqn{\beta}-median scoring function is defined by:

    \deqn{S(x, y, b) := |1 - (y/x)^b|}

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}

    \deqn{b \neq 0}

Range of function:

    \deqn{S(x, y, b) \geq 0, \forall x, y > 0, b \neq 0}
}

\value{
Vector of \eqn{\beta}-median losses.
}

\note{
For details on the \eqn{\beta}-median scoring function, see Gneiting (2011).

The \eqn{\beta}-median functional, \eqn{\textnormal{med}^{(\beta)}(F)} is the
median of a probability distribution whose density is proportional to
\eqn{y^\beta f(y)}, where \eqn{f} is the density of the probability distribution
\eqn{F} of \eqn{y} (Gneiting 2011).

The \eqn{\beta}-median scoring function is negatively oriented (i.e. the
smaller, the better).

The \eqn{\beta}-median scoring function is strictly
\eqn{\mathbb{F}^{(w)}}-consistent for the \eqn{\textnormal{med}^{(\beta)}(F)}
functional. \eqn{\mathbb{F}} is the family of probability distributions for
which \eqn{\textnormal{E}_F[Y]} exists and is finite. \eqn{\mathbb{F}^{(w)}} is
the subclass of probability distributions in \eqn{\mathbb{F}}, which are such
that \eqn{w(y) f(y)}, \eqn{w(y) = y^\beta} has finite integral over
\eqn{(0, \infty)}, and the probability distribution \eqn{F^{(w)}} with density
proportional to \eqn{w(y) f(y)} belongs to \eqn{\mathbb{F}} (see Theorems 5 and
9 in Gneiting 2011)
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.
}

\examples{
# Compute the bmedian scoring function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3,
    b = c(-1, 1, 2)
)

df$bmedian_error <- bmedian_sf(x = df$x, y = df$y, b = df$b)

print(df)
}