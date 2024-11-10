\name{mv_if}

\alias{mv_if}

\title{
Mean - variance identification function
}

\description{
The function mv_if computes the mean - variance identification function, when
\eqn{y} materializes, \eqn{x_1} is the predictive mean and \eqn{x_2} is the
predictive variance.

The mean - variance identification function is defined in proposition (3.11) in
Fissler and Ziegel (2019).
}

\usage{
mv_if(x1, x2, y)
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
The mean - variance identification function is defined by:

    \deqn{
        V(x_1, x_2, y) := (x_1 - y, x_2 + x_1^2 - y^2)
    }

Domain of function:

    \deqn{x_1 \in \mathbb{R}}

    \deqn{x_2 > 0}

    \deqn{y \in \mathbb{R}}
}

\value{
Matrix of mean - variance values of the identification function.
}

\note{
The mean functional is the mean \eqn{\textnormal{E}_F[Y]} of the probability
distribution \eqn{F} of \eqn{y} (Gneiting 2011).

The variance functional is the variance
\eqn{\textnormal{Var}_F[Y] := \textnormal{E}_F[Y^2] - (\textnormal{E}_F[Y])^{2}}
of the probability distribution \eqn{F} of \eqn{y} (Gneiting 2011)

The mean - variance identification function is a strict
\eqn{\mathbb{F}}-identification function for the pair (mean, variance)
functional (Gneiting 2011; Fissler and Ziegel 2019; Dimitriadis et al. 2024).

\eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[Y]} and \eqn{\textnormal{E}_F[Y^2]} exist and are finite
(Gneiting 2011; Fissler and Ziegel 2019; Dimitriadis et al. 2024).
}

\references{
Dimitriadis T, Fissler T, Ziegel JF (2024) Osband's principle for identification
functions. \emph{Statistical Papers} \bold{65}:1125--1132.
\doi{10.1007/s00362-023-01428-x}.

Fissler T, Ziegel JF (2019) Order-sensitivity and equivariance of scoring
functions. \emph{Electronic Journal of Statistics} \bold{13(1)}:1166--1211.
\doi{10.1214/19-EJS1552}.

Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.
}

\examples{
# Compute the mean - variance identification function.

df <- data.frame(
    y = rep(x = 0, times = 6),
    x1 = c(2, 2, -2, -2, 0, 0),
    x2 = c(1, 2, 1, 2, 1, 2)
)

v <- as.data.frame(mv_if(x1 = df$x1, x2 = df$x2, y = df$y))

print(cbind(df, v))
}