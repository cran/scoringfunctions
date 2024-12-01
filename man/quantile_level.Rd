\name{quantile_level}

\alias{quantile_level}

\title{
Sample quantile level function
}

\description{
The function quantile_level computes the sample quantile level, when
\eqn{\textbf{\textit{y}}} materialises and \eqn{\textbf{\textit{x}}} is the
predictive quantile at level \eqn{p}.
}

\usage{
quantile_level(x, y)
}

\arguments{
\item{x}{Predictive quantile (prediction) at level \eqn{p}. It can be a vector
of length \eqn{n} (must have the same length as \eqn{\textbf{\textit{y}}}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{\textbf{\textit{x}}}).}
}

\details{
The sample quantile level function is defined by:

    \deqn{P(x, y) := (1/n) \sum_{i = 1}^{n} V(x_i, y_i)}

    where

    \deqn{\textbf{\textit{x}} = (x_1, ..., x_n)^\mathsf{T}}

    \deqn{\textbf{\textit{y}} = (y_1, ..., y_n)^\mathsf{T}}

    and

    \deqn{V(x, y) := \textbf{1} \lbrace x \geq y \rbrace}

Domain of function:

    \deqn{\textbf{\textit{x}} \in \mathbb{R}^n}

    \deqn{\textbf{\textit{y}} \in \mathbb{R}^n}
}

\value{
Value of the sample quantile level.
}

\note{
The sample quantile level is directly related to the quantile identification
function \link{quantile_if}.

If \eqn{\textbf{\textit{y}}} materialises and \eqn{\textbf{\textit{x}}} is the
predictive quantile at level \eqn{p}, then ideally, the sample quantile level
should be equal to the nominal quantile level \eqn{p}.
}

\examples{
# Compute the sample quantile level.

set.seed(12345)

x <- qnorm(p = 0.75, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)

y <- rnorm(n = 1000, mean = 0, sd = 1)

print(quantile_level(x = x, y = y))
}