\name{aerr_sf}

\alias{aerr_sf}

\title{
Absolute error scoring function
}

\description{
The function aerr_sf computes the absolute error scoring function when \eqn{y}
materialises and \eqn{x} is the predictive median functional.

The absolute error scoring function is defined in Table 1 in Gneiting (2011).
}

\usage{
aerr_sf(x, y)
}

\arguments{
\item{x}{Predictive median functional (prediction). It can be a vector of length
\eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The absolute error scoring function is defined by:

    \deqn{S(x, y) := |x - y|}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y \in \mathbb{R}}
}

\value{
Vector of absolute errors.
}

\note{
For details on the absolute error scoring function, see Gneiting (2011).

The median functional is the median of the probability distribution \eqn{F} of
\eqn{y} (Gneiting 2011).

The absolute error scoring function is negatively oriented (i.e. the smaller,
the better).

The absolute error scoring function is strictly \eqn{\mathbb{F}}-consistent for
the median functional. \eqn{\mathbb{F}} is the family of probability
distributions \eqn{F} for which \eqn{\textnormal{E}_F[Y]} exists and is finite
(Raiffa and Schlaifer 1961, p.196; Ferguson 1967, p.51; Thomson 1979; Saerens
2000; Gneiting 2011).
}

\references{
Ferguson TS (1967) Mathematical Statistics: A Decision-Theoretic Approach.
Academic Press, New York.

Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Raiffa H,Schlaifer R (1961) Applied Statistical Decision Theory. Colonial Press,
Clinton.

Saerens M (2000) Building cost functions minimizing to some summary statistics.
\emph{IEEE Transactions on Neural Networks} \bold{11(6)}:1263--1271.
\doi{10.1109/72.883416}.

Thomson W (1979) Eliciting production possibilities from a well-informed
manager. \emph{Journal of Economic Theory} \bold{20(3)}:360--380.
\doi{10.1016/0022-0531(79)90042-5}.
}

\examples{
# Compute the absolute error scoring function.

df <- data.frame(
    y = rep(x = 0, times = 5),
    x = -2:2
)

df$absolute_error <- aerr_sf(x = df$x, y = df$y)

print(df)
}