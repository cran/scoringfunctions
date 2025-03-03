\name{serrsq_sf}

\alias{serrsq_sf}

\title{
Squared error of squares scoring function
}

\description{
The function serrsq_sf computes the squared error of squares scoring function
when \eqn{y} materialises and \eqn{x} is the \eqn{\sqrt{\textnormal{E}_F[Y^2]}}
predictive functional.

The squared error of squares scoring function is defined in Thirel et al.
(2024).
}

\usage{
serrsq_sf(x, y)
}

\arguments{
\item{x}{Predictive \eqn{\sqrt{\textnormal{E}_F[Y^2]}} functional (prediction).
It can be a vector of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The squared error of squares scoring function is defined by:

    \deqn{S(x, y) := (x^2 - y^2)^2}

Domain of function:

    \deqn{x \geq 0}

    \deqn{y \geq 0}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y \geq 0}
}

\value{
Vector of squared errors of squared-transformed variables.
}

\note{
For details on the squared error of squares scoring function, see Thirel et al.
(2024).

The squared error of squares scoring function is negatively oriented (i.e. the
smaller, the better).

The squared error of squares scoring function is strictly
\eqn{\mathbb{F}}-consistent for the \eqn{\sqrt{\textnormal{E}_F[Y^2]}}
functional. \eqn{\mathbb{F}} is the family of probability distributions \eqn{F}
for which \eqn{\textnormal{E}_F[Y^2]} exists and is finite (Tyralis and
Papacharalampous 2025).
}

\references{
Thirel G, Santos L, Delaigue O, Perrin C (2024) On the use of streamflow
transformations for hydrological model calibration.
\emph{Hydrology and Earth System Sciences} \bold{28(21)}:4837--4860.
\doi{10.5194/hess-28-4837-2024}.

Tyralis H, Papacharalampous G (2025) Transformations of predictions and
realizations in consistent scoring functions. \doi{10.48550/arXiv.2502.16542}.
}

\examples{
# Compute the squarer error of squares scoring function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3
)

df$squaredsq_error <- serrsq_sf(x = df$x, y = df$y)

print(df)
}