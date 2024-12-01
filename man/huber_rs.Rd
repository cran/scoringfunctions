\name{huber_rs}

\alias{huber_rs}

\title{
Mean Huber score
}

\description{
The function huber_rs computes the mean Huber score with parameter
\eqn{a}, when \eqn{\textbf{\textit{y}}} materialises and
\eqn{\textbf{\textit{x}}} is the prediction.

Mean Huber score is a realised score corresponding to the Huber scoring function
\link{huber_sf}.
}

\usage{
huber_rs(x, y, a)
}

\arguments{
\item{x}{Prediction. It can be a vector of length \eqn{n} (must have the same
length as \eqn{\textbf{\textit{y}}}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{\textbf{\textit{x}}}).}

\item{a}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}) or a scalar.}
}

\details{
The mean Huber score is defined by:

    \deqn{S(\textbf{\textit{x}}, \textbf{\textit{y}}, a) := (1/n)
    \sum_{i = 1}^{n} L(x_i, y_i, a)}

    where

    \deqn{\textbf{\textit{x}} = (x_1, ..., x_n)^\mathsf{T}}

    \deqn{\textbf{\textit{y}} = (y_1, ..., y_n)^\mathsf{T}}

    and

   \deqn{
        L(x, y, a) := \left\{
        \begin{array}{ll}
        \dfrac{1}{2} (x - y)^2, & |x - y| \leq a\\
        a |x - y| - \dfrac{1}{2} a^2, & |x - y| > a
        \end{array}
        \right.
    }

Domain of function:

    \deqn{\textbf{\textit{x}} \in \mathbb{R}^n}

    \deqn{\textbf{\textit{y}} \in \mathbb{R}^n}

    \deqn{a > 0}

Range of function:

    \deqn{S(\textbf{\textit{x}}, \textbf{\textit{y}}, a) \geq 0,
    \forall \textbf{\textit{x}}, \textbf{\textit{y}} \in \mathbb{R}^n, a > 0}
}

\value{
Value of the mean Huber score.
}

\note{
For details on the Huber scoring function, see \link{huber_sf}.

The concept of realised (average) scores is defined by Gneiting (2011) and
Fissler and Ziegel (2019).

The mean Huber score is the realised (average) score corresponding to the Huber
scoring function.
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
# Compute the Huber mean score.

set.seed(12345)

a <- 0.5

x <- 0

y <- rnorm(n = 100, mean = 0, sd = 1)

print(huber_rs(x = x, y = y, a = a))

print(huber_rs(x = rep(x = x, times = 100), y = y, a = a))
}