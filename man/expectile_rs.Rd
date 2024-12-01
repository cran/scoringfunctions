\name{expectile_rs}

\alias{expectile_rs}

\title{
Realised expectile score
}

\description{
The function expectile_rs computes the realised expectile score at a specific
level \eqn{p} when \eqn{\textbf{\textit{y}}} materialises and
\eqn{\textbf{\textit{x}}} is the prediction.

Realised expectile score is a realised score corresponding to the expectile
scoring function \link{expectile_sf}.
}

\usage{
expectile_rs(x, y, p)
}

\arguments{
\item{x}{Prediction. It can be a vector of length \eqn{n} (must have the same
length as \eqn{\textbf{\textit{y}}}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{\textbf{\textit{x}}}).}

\item{p}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{\textbf{\textit{y}}}) or a scalar value.}
}

\details{
The realized expectile score is defined by:

    \deqn{S(\textbf{\textit{x}}, \textbf{\textit{y}}, p) := (1/n)
    \sum_{i = 1}^{n} L(x_i, y_i, p)}

    where

    \deqn{\textbf{\textit{x}} = (x_1, ..., x_n)^\mathsf{T}}

    \deqn{\textbf{\textit{y}} = (y_1, ..., y_n)^\mathsf{T}}

    and

    \deqn{
        L(x, y, p) := |\textbf{1} \lbrace x \geq y \rbrace - p| (x - y)^2
    }

Domain of function:

    \deqn{\textbf{\textit{x}} \in \mathbb{R}^n}

    \deqn{\textbf{\textit{y}} \in \mathbb{R}^n}

    \deqn{0 < p < 1}
    
Range of function:

    \deqn{S(\textbf{\textit{x}}, \textbf{\textit{y}}, p) \geq 0,
    \forall \textbf{\textit{x}}, \textbf{\textit{y}} \in \mathbb{R}^n,
    p \in (0, 1)}
}

\value{
Value of the realised expectile score.
}

\note{
For details on the expectile scoring function, see \link{expectile_sf}.

The concept of realised (average) scores is defined by Gneiting (2011) and
Fissler and Ziegel (2019).

The realised expectile score is the realised (average) score corresponding to
the expectile scoring function.
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
# Compute the realised expectile score.

set.seed(12345)

x <- 0.5

y <- rnorm(n = 100, mean = 0, sd = 1)

print(expectile_rs(x = x, y = y, p = 0.7))

print(expectile_rs(x = rep(x = x, times = 100), y = y, p = 0.7))
}