\name{errorspread_sf}

\alias{errorspread_sf}

\title{
Error - spread scoring function
}

\description{
The function errorspread_sf computes the error - spread scoring function, when
\eqn{y} materialises, \eqn{x_1} is the predictive mean, \eqn{x_2} is the
predictive variance and \eqn{x_3} is the predictive skewness.

The error - spread scoring function is defined by eq. (14) in Christensen et
al. (2015).
}

\usage{
errorspread_sf(x1, x2, x3, y)
}

\arguments{
\item{x1}{Predictive mean (prediction). It can be a vector of length \eqn{n}
(must have the same length as \eqn{y}).}

\item{x2}{Predictive variance (prediction). It can be a vector of length \eqn{n}
(must have the same length as \eqn{y}).}

\item{x3}{Predictive skewness (prediction). It can be a vector of length \eqn{n}
(must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x_1}).}
}

\details{
The error - spread scoring function is defined by:

    \deqn{
        S(x_1, x_2, x_3, y) := (x_2 - (x_1 - y)^2 - (x_1 - y) x_2^{1/2} x_3)^2
    }

Domain of function:

    \deqn{x_1 \in \mathbb{R}}

    \deqn{x_2 > 0}
    
    \deqn{x_3 \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}
}

\value{
Vector of error - spread losses.
}

\note{
The mean functional is the mean \eqn{\textnormal{E}_F[Y]} of the probability
distribution \eqn{F} of \eqn{y} (Christensen et al. 2015).

The variance functional is the variance
\eqn{\textnormal{Var}_F[Y] := \textnormal{E}_F[Y^2] - (\textnormal{E}_F[Y])^{2}}
of the probability distribution \eqn{F} of \eqn{y} (Christensen et al. 2015).

The skewness functional is the skewness \eqn{\textnormal{Sk}_F[Y] :=
\textnormal{E}_F[((Y - \textnormal{E}_F[Y])/(\textnormal{Var}_F[Y])^{1/2})^3]}
(Christensen et al. 2015).

The error - spread scoring function is negatively oriented (i.e. the smaller,
the better).

The error - spread scoring function is strictly consistent for the triple (mean,
variance, skewness) functional (Christensen et al. 2015).
}

\references{
Christensen HM, Moroz IM, Palmer TN (2015) Evaluation of ensemble forecast
uncertainty using a new proper score: Application to medium-range and seasonal
forecasts. \emph{Quarterly Journal of the Royal Meteorological Society}
\bold{141(687)(Part B)}:538--549. \doi{10.1002/qj.2375}.
}

\examples{
# Compute the error - spread scoring function.

df <- data.frame(
    y = rep(x = 0, times = 6),
    x1 = c(2, 2, -2, -2, 0, 0),
    x2 = c(1, 2, 1, 2, 1, 2),
    x3 = c(3, 3, -3, -3, 0, 0)
)

df$errorspread_penalty <- errorspread_sf(x1 = df$x1, x2 = df$x2, x3 = df$x3,
    y = df$y)

print(df)
}