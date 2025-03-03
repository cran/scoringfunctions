\name{meanlog_if}

\alias{meanlog_if}

\title{
Log-transformed identification function
}

\description{
The function meanlog_if computes the log-transformed identification function,
when \eqn{y} materialises and \eqn{\exp(\textnormal{E}_F[\log(Y)])} is the
predictive functional.

The log-transformed identification function is defined in Tyralis and
Papacharalampous (2025).
}

\usage{
meanlog_if(x, y)
}

\arguments{
\item{x}{Predictive \eqn{\exp(\textnormal{E}_F[\log(Y)])} functional. It can be
a vector of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The mean identification function is defined by:

    \deqn{V(x, y) := \log(x) - \log(y)}

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}

Range of function:

    \deqn{V(x, y) \in \mathbb{R}, \forall x, y > 0}
}

\value{
Vector of values of the log-transformed identification function.
}

\note{
The log-transformed identification function is a strict
\eqn{\mathbb{F}}-identification function for the log-transformed expectation
\eqn{\exp(\textnormal{E}_F[\log(Y)])} (Tyralis and Papacharalampous 2025).

\eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[\log(Y)]} exists and is finite (Tyralis and
Papacharalampous 2025).
}

\references{
Tyralis H, Papacharalampous G (2025) Transformations of predictions and
realizations in consistent scoring functions. \doi{10.48550/arXiv.2502.16542}.
}

\examples{
# Compute the log-transformed identification function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3
)

df$meanlog_if <- meanlog_if(x = df$x, y = df$y)
}