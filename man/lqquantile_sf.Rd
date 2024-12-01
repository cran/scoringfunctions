\name{lqquantile_sf}

\alias{lqquantile_sf}

\title{
\eqn{L_q}-quantile scoring function
}

\description{
The function lqquantile_sf computes the \eqn{L_q}-quantile scoring function at a
specific level \eqn{p}, when \eqn{y} materialises and \eqn{x} is the predictive
\eqn{L_q}-quantile at level \eqn{p}.

The \eqn{L_q}-quantile scoring function is defined by Chen (1996).
}

\usage{
lqquantile_sf(x, y, p, q)
}

\arguments{
\item{x}{Predictive \eqn{L_q}-quantile at level \eqn{p}. It can be a vector of
length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{p}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}

\item{q}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The \eqn{L_q}-quantile scoring function is defined by:

    \deqn{
        S(x, y, p, q) := |\textbf{1} \lbrace x \geq y \rbrace - p| |x - y|^q
    }

or equivalently,

    \deqn{
        S(x, y, p, q) := p |\max \lbrace -(x - y), 0 \rbrace|^q +
        (1 - p) |\max \lbrace x - y, 0 \rbrace|^q
    }

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{0 < p < 1}

    \deqn{q \geq 2}
    
Range of function:

    \deqn{S(x, y, p, q) \geq 0, \forall x, y \in \mathbb{R}, p \in (0, 1),
        q \geq 2}
}

\value{
Vector of \eqn{L_q}-quantile losses.
}

\note{
For the definition of \eqn{L_q}-quantiles, see Chen (1996). In particular,
\eqn{L_q}-quantiles at level \eqn{p} are the solution of the equation
\eqn{\textnormal{E}_F[V(x, Y, p, q)] = 0}, where

    \deqn{
        V(x, y, p, q) := q (\textbf{1} \lbrace x \geq y \rbrace - p)
            |x - y|^{q - 1}
    }

The \eqn{L_q}-quantile scoring function is negatively oriented (i.e. the
smaller, the better).

The \eqn{L_q}-quantile scoring function is strictly \eqn{\mathbb{F}}-consistent
for the \eqn{L_q}-quantile functional at level \eqn{p}. \eqn{\mathbb{F}} is the
family of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[Y^q]} exists and is finite (Chen 2016; Bellini 2014).
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
# Compute the Lq-quantile scoring function at level p.

df <- data.frame(
    y = rep(x = 0, times = 6),
    x = c(2, 2, -2, -2, 0, 0),
    p = rep(x = c(0.05, 0.95), times = 3),
    q = c(2, 3, 2, 3, 2, 3)
)

df$lqquantile_penalty <- lqquantile_sf(x = df$x, y = df$y, p = df$p, q = df$q)

print(df)
}