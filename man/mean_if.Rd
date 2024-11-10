\name{mean_if}

\alias{mean_if}

\title{
Mean identification function
}

\description{
The function mean_if computes the mean identification function , when \eqn{y}
materializes and \eqn{x} is the predictive mean.

The mean identification function is defined in Table 9 in Gneiting (2011).
}

\usage{
mean_if(x, y)
}

\arguments{
\item{x}{Predictive expectile (prediction) at level \eqn{p}. It can be a vector
of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The mean identification function is defined by:

    \deqn{V(x, y) := x - y}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

Range of function:

    \deqn{V(x, y) \in \mathbb{R}}
}

\value{
Vector of values of the mean identification function.
}

\note{
The mean functional is the mean \eqn{\textnormal{E}_F[Y]} of the probability
distribution \eqn{F} of \eqn{y} (Gneiting 2011).

The mean identification function is a strict \eqn{\mathbb{F}}-identification
function for the mean functional. (Gneiting 2011; Fissler and Ziegel 2016;
Dimitriadis et al. 2024).

\eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[Y]} exists and is finite (Gneiting 2011; Fissler and
Ziegel 2016; Dimitriadis et al. 2024).
}

\references{
Dimitriadis T, Fissler T, Ziegel JF (2024) Osband's principle for identification
functions. \emph{Statistical Papers} \bold{65}:1125--1132.
\doi{10.1007/s00362-023-01428-x}.

Fissler T, Ziegel JF (2016) Higher order elicitability and Osband's principle.
\emph{The Annals of Statistics} \bold{44(4)}:1680--1707.
\doi{10.1214/16-AOS1439}.

Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Newey WK, Powell JL (1987) Asymmetric least squares estimation and testing.
\emph{Econometrica} \bold{55(4)}:819--847. \doi{10.2307/1911031}.
}

\examples{
# Compute the mean identification function.

df <- data.frame(
    y = rep(x = 0, times = 3),
    x = c(-2, 0, 2)
)

df$mean_if <- mean_if(x = df$x, y = df$y)
}