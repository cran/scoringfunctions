\name{mae}

\alias{mae}

\title{
Mean absolute error (MAE)
}

\description{
The function mae computes the mean absolute error when \eqn{\textbf{\textit{y}}}
materialises and \eqn{\textbf{\textit{x}}} is the prediction.

Mean absolute error is a realised score corresponding to the absolute error
scoring function \link{aerr_sf}.
}

\usage{
mae(x, y)
}

\arguments{
\item{x}{Prediction. It can be a vector of length \eqn{n} (must have the same
length as \eqn{\textbf{\textit{y}}}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{\textbf{\textit{x}}}).}
}

\details{
The mean absolute error is defined by:

    \deqn{S(\textbf{\textit{x}}, \textbf{\textit{y}}) := (1/n)
    \sum_{i = 1}^{n} L(x_i, y_i)}

    where

    \deqn{\textbf{\textit{x}} = (x_1, ..., x_n)^\mathsf{T}}

    \deqn{\textbf{\textit{y}} = (y_1, ..., y_n)^\mathsf{T}}

    and

    \deqn{L(x, y) := |x - y|}

Domain of function:

    \deqn{\textbf{\textit{x}} \in \mathbb{R}^n}

    \deqn{\textbf{\textit{y}} \in \mathbb{R}^n}

Range of function:

    \deqn{S(\textbf{\textit{x}}, \textbf{\textit{y}}) \geq 0,
    \forall \textbf{\textit{x}}, \textbf{\textit{y}} \in \mathbb{R}^n}
}

\value{
Value of the mean absolute error.
}

\note{
For details on the absolute error scoring function, see \link{aerr_sf}.

The concept of realised (average) scores is defined by Gneiting (2011) and
Fissler and Ziegel (2019).

The mean absolute error is the realised (average) score corresponding to the
absolute error scoring function.
}

\references{
Fissler T, Ziegel JF (2019) Order-sensitivity and equivariance of scoring
functions. \emph{Electronic Journal of Statistics} \bold{13(1)}:1166--1211.
\doi{10.1214/19-EJS1552}.

Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.
}

\examples{
# Compute the mean absolute error.

set.seed(12345)

x <- 0

y <- rnorm(n = 100, mean = 0, sd = 1)

print(mae(x = x, y = y))

print(mae(x = rep(x = x, times = 100), y = y))
}