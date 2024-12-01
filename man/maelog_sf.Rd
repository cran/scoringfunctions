\name{maelog_sf}

\alias{maelog_sf}

\title{
MAE-LOG scoring function
}

\description{
The function maelog_sf computes the MAE-LOG scoring function when \eqn{y}
materialises and \eqn{x} is the predictive median functional.

The MAE-LOG scoring function is defined by eq. (11) in Patton (2011).
}

\usage{
maelog_sf(x, y)
}

\arguments{
\item{x}{Predictive median functional (prediction). It can be a vector of length
\eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The MAE-LOG scoring function is defined by:

    \deqn{S(x, y) := |\log(x/y)|}

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y > 0}
}

\value{
Vector of MAE-LOG losses.
}

\note{
For details on the MAE-LOG scoring function, see Gneiting (2011) and Patton
(2011).

The median functional is the median of the probability distribution \eqn{F} of
\eqn{y} (Gneiting 2011).

The MAE-LOG scoring function is negatively oriented (i.e. the smaller, the
better).

The MAE-LOG scoring function is strictly \eqn{\mathbb{F}}-consistent for the
median functional. \eqn{\mathbb{F}} is the family of probability distributions
\eqn{F} for which \eqn{\textnormal{E}_F[\log(Y)]} exists and is finite (Thomson
1979; Saerens 2000; Gneiting 2011).
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Patton AJ (2011) Volatility forecast comparison using imperfect volatility
proxies. \emph{Journal of Econometrics} \bold{160(1)}:246--256.
\doi{10.1016/j.jeconom.2010.03.034}.

Saerens M (2000) Building cost functions minimizing to some summary statistics.
\emph{IEEE Transactions on Neural Networks} \bold{11(6)}:1263--1271.
\doi{10.1109/72.883416}.

Thomson W (1979) Eliciting production possibilities from a well-informed
manager. \emph{Journal of Economic Theory} \bold{20(3)}:360--380.
\doi{10.1016/0022-0531(79)90042-5}.
}

\examples{
# Compute the MAE-LOG scoring function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3
)

df$mae_log_penalty <- maelog_sf(x = df$x, y = df$y)

print(df)
}