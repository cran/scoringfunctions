\name{huber_sf}

\alias{huber_sf}

\title{
Huber scoring function
}

\description{
The function huber_sf computes the Huber scoring function with parameter
\eqn{a}, when \eqn{y} materializes and \eqn{x} is the predictive Huber mean.

The Huber scoring function is defined in Huber (1964).
}

\usage{
huber_sf(x, y, a)
}

\arguments{
\item{x}{Predictive Huber mean (prediction). It can be a vector of length
\eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{a}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The Huber scoring function is defined by:
    
   \deqn{
        S(x, y, a) := \left\{
        \begin{array}{ll}
        \dfrac{1}{2} (x - y)^2, & |x - y| \leq a\\
        a |x - y| - \dfrac{1}{2} a^2, & |x - y| > a
        \end{array}
        \right.
    }

or equivalently

    \deqn{
        S(x, y, a) := (1/2) \kappa_{a,a}(x - y) (2 (x - y) - \kappa_{a,a}(x - y))
    }

where \eqn{\kappa_{a,b}(t)} is the capping function defined by:

    \deqn{\kappa_{a,b}(t) := \max \lbrace \min \lbrace t,b \rbrace, -a \rbrace}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{a > 0}
    
Range of function:

    \deqn{S(x, y, a) \geq 0, \forall x, y \in \mathbb{R}, a > 0}
}

\value{
Vector of Huber losses.
}

\note{
For the definition of Huber mean, see Taggart (2022).

The Huber scoring function is negatively oriented (i.e. the smaller, the
better).

The Huber scoring function is strictly \eqn{\mathbb{F}}-consistent for the Huber
mean. \eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for
which \eqn{\textnormal{E}_F[Y^2 - (Y - a)^2]} and
\eqn{\textnormal{E}_F[Y^2 - (Y + a)^2]} (or equivalently
\eqn{\textnormal{E}_F[Y]}) exist and are finite (Taggart 2022).
}

\references{
Huber PJ (1964) Robust estimation of a location parameter.
\emph{Annals of Mathematical Statistics} \bold{35(1)}:73--101.
\doi{10.1214/aoms/1177703732}.

Taggart RJ (2022) Point forecasting and forecast evaluation with generalized
Huber loss. \emph{Electronic Journal of Statistics} \bold{16}:201--231.
\doi{10.1214/21-EJS1957}.
}

\examples{
# Compute the Huber scoring function.

df <- data.frame(
    x = c(-3, -2, -1, 0, 1, 2, 3),
    y = c(0, 0, 0, 0, 0, 0, 0),
    a = c(2.7, 2.5, 0.6, 0.7, 0.9, 1.2, 5)
)

df$huber_penalty <- huber_sf(x = df$x, y = df$y, a = df$a)

print(df)
}