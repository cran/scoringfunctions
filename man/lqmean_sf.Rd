\name{lqmean_sf}

\alias{lqmean_sf}

\title{
\eqn{L_q}-mean scoring function
}

\description{
The function lqmean_sf computes the \eqn{L_q}-mean scoring function, when
\eqn{y} materialises and \eqn{x} is the predictive \eqn{L_q}-mean.

The \eqn{L_q}-mean scoring function is defined by Chen (1996). It is equivalent
to the \eqn{L_q}-quantile scoring function at level \eqn{p = 1/2}, up to a
multiplicative constant.
}

\usage{
lqmean_sf(x, y, q)
}

\arguments{
\item{x}{Predictive \eqn{L_q}-mean. It can be a vector of length \eqn{n} (must
have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{q}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The \eqn{L_q}-mean scoring function is defined by:

    \deqn{
        S(x, y, q) := |x - y|^q
    }

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{q \geq 1}
    
Range of function:

    \deqn{S(x, y, q) \geq 0, \forall x, y \in \mathbb{R}, q \geq 1}
}

\value{
Vector of \eqn{L_q}-mean losses.
}

\note{
For the definition of \eqn{L_q}-means, see Chen (1996). In particular,
\eqn{L_q}-means are the solution of the equation
\eqn{\textnormal{E}_F[V(x, Y, q)] = 0}, where

    \deqn{
        V(x, y, p, q) := q \textnormal{sign}(x - y) |x - y|^{q - 1}
    }

\eqn{L_q}-means are \eqn{L_q}-quantiles at level \eqn{p = 1/2}.

The \eqn{L_q}-mean scoring function is negatively oriented (i.e. the smaller,
the better).

The \eqn{L_q}-mean scoring function is strictly \eqn{\mathbb{F}}-consistent
for the \eqn{L_q}-mean functional. \eqn{\mathbb{F}} is the family of probability
distributions \eqn{F} for which \eqn{\textnormal{E}_F[Y^q]} exists and is finite
(Chen 2016; Bellini 2014).
}

\references{
Bellini F, Klar B, Muller A, Gianin ER (2014) Generalized quantiles as risk
measures. \emph{Insurance: Mathematics and Economics} \bold{54}:41--48.
\doi{10.1016/j.insmatheco.2013.10.015}.

Chen Z (1996) Conditional \eqn{L_p}-quantiles and their application to the
testing of symmetry in non-parametric regression.
\emph{Statistics and Probability Letters} \bold{29(2)}:107--115.
\doi{10.1016/0167-7152(95)00163-8}.
}

\examples{
# Compute the Lq-mean scoring function.

df <- data.frame(
    y = rep(x = 0, times = 6),
    x = c(2, 2, -2, -2, 0, 0),
    q = c(2, 3, 2, 3, 2, 3)
)

df$lqmean_penalty <- lqmean_sf(x = df$x, y = df$y, q = df$q)

print(df)
}