\name{linex_sf}

\alias{linex_sf}

\title{
LINEX scoring function
}

\description{
The function linex_sf computes the LINEX scoring function with parameter \eqn{a}
when \eqn{y} materialises and \eqn{x} is the predictive
\eqn{-(1/a) \log{\textnormal{E}_F[\textnormal{e}^{-a Y}]}} moment generating
functional.

The LINEX scoring function is defined by Varian (1975).
}

\usage{
linex_sf(x, y, a)
}

\arguments{
\item{x}{Predictive \eqn{-(1/a) \log{\textnormal{E}_F[\textnormal{e}^{-a Y}]}}
moment generating functional (prediction). It can be a vector of length \eqn{n}
(must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{a}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The LINEX scoring function is defined by:

    \deqn{S(x, y, a) := \textnormal{e}^{a (x - y)} - a (x - y) - 1}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{a \neq 0}

Range of function:

    \deqn{S(x, y, a) \geq 0, \forall x, y \in \mathbb{R}, a \neq 0}
}

\value{
Vector of LINEX losses.
}

\note{
For details on the LINEX scoring function, see Varian (1975) and Zellner (1986).

The LINEX scoring function is negatively oriented (i.e. the smaller, the
better).

The LINEX scoring function is strictly \eqn{\mathbb{F}}-consistent for
the \eqn{-(1/a) \log{\textnormal{E}_F[\textnormal{e}^{-a Y}]}} moment generating
functional. \eqn{\mathbb{F}} is the family of probability distributions \eqn{F}
for which \eqn{\textnormal{E}_F[\textnormal{e}^{-a Y}]} and
\eqn{\textnormal{E}_F[Y]} exist and are finite (Varian 1975; Zellner 1986;
Gneiting 2011).
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Varian HR (1975) A Bayesian approach to real estate assessment. In: Fienberg SE,
Zellner A(eds) \emph{Studies in Bayesian Econometrics and Statistics in Honor of
Leonard J. Savage}. Amsterdam: North-Holland, pp 195--208.

Zellner A (1986) Bayesian estimation and prediction using asymmetric loss
functions. \emph{Journal of the American Statistical Association}
\bold{81(394)}:446--451. \doi{10.1080/01621459.1986.10478289}.
}

\examples{
# Compute the LINEX scoring function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3,
    a = c(-1, 1, 2)
)

df$linex_loss <- linex_sf(x = df$x, y = df$y, a = df$a)

print(df)
}