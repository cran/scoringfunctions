\name{mv_sf}

\alias{mv_sf}

\title{
Mean - variance scoring function
}

\description{
The function mv_sf computes the mean - variance scoring function, when \eqn{y}
materializes, \eqn{x_1} is the predictive mean and \eqn{x_2} is the predictive
variance.

The mean - variance scoring function is defined by eq. (3.11) in Fissler and
Ziegel (2019).
}

\usage{
mv_sf(x1, x2, y)
}

\arguments{
\item{x1}{Predictive mean (prediction). It can be a vector of length \eqn{n}
(must have the same length as \eqn{y}).}

\item{x2}{Predictive variance (prediction). It can be a vector of length \eqn{n}
(must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The mean - variance scoring function is defined by:

    \deqn{
        S(x_1, x_2, y) := x_2^{-2} (x_1^2 - 2 x_2 - 2 x_1 y + y^2)
    }

Domain of function:

    \deqn{x_1 \in \mathbb{R}}

    \deqn{x_2 > 0}

    \deqn{y \in \mathbb{R}}
}

\value{
Vector of mean - variance losses.
}

\note{
The mean functional is the mean \eqn{\textnormal{E}_F[Y]} of the probability
distribution \eqn{F} of \eqn{y} (Gneiting 2011).

The variance functional is the variance
\eqn{\textnormal{Var}_F[Y] := \textnormal{E}_F[Y^2] - (\textnormal{E}_F[Y])^{2}}
of the probability distribution \eqn{F} of \eqn{y} (Gneiting 2011)

The mean - variance scoring function is negatively oriented (i.e.
the smaller, the better).

The mean - variance scoring function is strictly consistent for the pair (mean,
variance) functional (Osband 1985, p.9; Gneiting 2011; Fissler and Ziegel 2019).
}

\references{
Fissler T, Ziegel JF (2019) Order-sensitivity and equivariance of scoring
functions. \emph{Electronic Journal of Statistics} \bold{13(1)}:1166--1211.
\doi{10.1214/19-EJS1552}.

Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Osband KH (1985) Providing Incentives for Better Cost Forecasting. PhD thesis,
University of California, Berkeley. \doi{10.5281/zenodo.4355667}.
}

\examples{
# Compute the mean - variance scoring function.

df <- data.frame(
    y = rep(x = 0, times = 6),
    x1 = c(2, 2, -2, -2, 0, 0),
    x2 = c(1, 2, 1, 2, 1, 2)
)

df$mv_penalty <- mv_sf(x1 = df$x1, x2 = df$x2, y = df$y)

print(df)
}