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

Domain of function:

    \deqn{x \in \R}

    \deqn{y \in \R}

    \deqn{a > 0}
    
Range of function:

    \deqn{S(x, y, a) \geq 0, \forall x, y \in \R, a > 0}
}

\value{
Vector of Huber losses.
}

\note{
For the definition of Huber mean, see Taggart (2022).

The Huber scoring function is negatively oriented (i.e. the smaller, the
better).

The Huber scoring function is strictly consistent for the Huber mean relative to
the family \eqn{\mathbb{F}} of potential probability distributions \eqn{F} for
the future \eqn{y} for which \eqn{E_F[Y^2 - (Y - a)^2]} and
\eqn{E_F[Y^2 - (Y + a)^2]} exist and are finite (Taggart 2022).
}

\references{
Huber PJ (1964) Robust Estimation of a Location Parameter.
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