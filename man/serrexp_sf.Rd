\name{serrexp_sf}

\alias{serrexp_sf}

\title{
Squared error exp scoring function
}

\description{
The function serrexp_sf computes the squared error exp scoring function when
\eqn{y} materialises and \eqn{x} is the \eqn{(1/a) \log(\textnormal{E}_F[\exp(aY)])}
predictive entropic risk measure (Gerber 1974).

The squared error exp scoring function is defined in Fissler and Pesenti (2023).
}

\usage{
serrexp_sf(x, y, a)
}

\arguments{
\item{x}{Predictive \eqn{(1/a) \log(\textnormal{E}_F[\exp(aY)])} functional
(prediction). It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{a}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The squared error exp scoring function is defined by:

    \deqn{S(x, y) := (\exp(ax) - \exp(ay))^2}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{a \neq 0}

Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y \in \mathbb{R}, a \neq 0}
}

\value{
Vector of squared errors of exp-transformed variables.
}

\note{
For details on the squared error exp scoring function, see Fissler and Pesenti
(2023).

The squared error exp scoring function is negatively oriented (i.e. the smaller,
the better).

The squared error exp scoring function is strictly \eqn{\mathbb{F}}-consistent
for the \eqn{(1/a) \log(\textnormal{E}_F[\exp(aY)])} entropic risk measure
functional. \eqn{\mathbb{F}} is the family of probability distributions \eqn{F}
for which \eqn{\textnormal{E}_F[\exp(aY)]} exists and is finite (Fissler and
Pesenti 2023; Tyralis and Papacharalampous 2025).
}

\references{
Fissler T, Pesenti SM (2023) Sensitivity measures based on scoring functions.
\emph{European Journal of Operational Research} \bold{307(3)}:1408--1423.
\doi{10.1016/j.ejor.2022.10.002}.

Gerber HU (1974) On additive premium calculation principles.
\emph{ASTIN Bulletin: The Journal of the IAA} \bold{7(3)}:215--222.
\doi{10.1017/S0515036100006061}.

Tyralis H, Papacharalampous G (2025) Transformations of predictions and
realizations in consistent scoring functions. \doi{10.48550/arXiv.2502.16542}.
}

\examples{
# Compute the squarer error exp scoring function.

df <- data.frame(
    y = rep(x = 0, times = 5),
    x = -2:2,
    a = c(-2, -1, 1, 2, 3)
)

df$squaredexp_error <- serrexp_sf(x = df$x, y = df$y, a = df$a)

print(df)
}