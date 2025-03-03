\name{serrlog_sf}

\alias{serrlog_sf}

\title{
Squared error log scoring function
}

\description{
The function serrlog_sf computes the squared error log scoring function when
\eqn{y} materialises and \eqn{x} is the \eqn{\exp(\textnormal{E}_F[\log(Y)])}
predictive functional.

The squared error log scoring function is defined in Houghton-Carr (1999).
}

\usage{
serrlog_sf(x, y)
}

\arguments{
\item{x}{Predictive \eqn{\exp(\textnormal{E}_F[\log(Y)])} functional
(prediction). It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The squared error scoring function is defined by:

    \deqn{S(x, y) := (\log(x) - \log(y))^2}

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y > 0}
}

\value{
Vector of squared errors of log-transformed variables.
}

\note{
For details on the squared error log scoring function, see Houghton-Carr (1999).

The squared error log scoring function is negatively oriented (i.e. the smaller,
the better).

The squared error log scoring function is strictly \eqn{\mathbb{F}}-consistent
for the \eqn{\exp(\textnormal{E}_F[\log(Y)])} functional. \eqn{\mathbb{F}} is
the family of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[\log(Y)]} exists and is finite (Tyralis and
Papacharalampous 2025).
}

\references{
Houghton-Carr HA (1999) Assessment criteria for simple conceptual daily
rainfall-runoff models. \emph{Hydrological Sciences Journal}
\bold{44(2)}:237--261. \doi{10.1080/02626669909492220}.

Tyralis H, Papacharalampous G (2025) Transformations of predictions and
realizations in consistent scoring functions. \doi{10.48550/arXiv.2502.16542}.
}

\examples{
# Compute the squarer error log scoring function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3
)

df$squaredlog_error <- serrlog_sf(x = df$x, y = df$y)

print(df)
}