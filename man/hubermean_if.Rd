\name{hubermean_if}

\alias{hubermean_if}

\title{
Huber mean identification function
}

\description{
The function hubermean_if computes the Huber mean identification function with
parameter \eqn{a}, when \eqn{y} materialises and \eqn{x} is the predictive Huber
mean.

The Huber mean identification function is defined by eq. (3.5) in Taggart
(2022).
}

\usage{
hubermean_if(x, y, a)
}

\arguments{
\item{x}{Predictive Huber mean (prediction). It can be a vector of length
\eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{a}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The Huber mean identification function is defined by:

    \deqn{V(x, y, a) := (1/2) \kappa_{a,a}(x - y)}

where \eqn{\kappa_{a,b}(t)} is the capping function defined by:

    \deqn{\kappa_{a,b}(t) := \max \lbrace \min \lbrace t,b \rbrace, -a \rbrace}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{a > 0}
}

\value{
Vector of values of the Huber mean identification function.
}

\note{
For the definition of Huber mean, see Taggart (2022).

The Huber mean identification function is a strict
\eqn{\mathbb{F}}-identification function for the Huber mean functional (Taggart
2022).

\eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for which
for which \eqn{\textnormal{E}_F[Y]} exists and is finite (Taggart 2022).
}

\references{
Taggart RJ (2022) Point forecasting and forecast evaluation with generalized
Huber loss. \emph{Electronic Journal of Statistics} \bold{16}:201--231.
\doi{10.1214/21-EJS1957}.
}

\examples{
# Compute the Huber mean identification function.

df <- data.frame(
    x = c(-3, -2, -1, 0, 1, 2, 3),
    y = c(0, 0, 0, 0, 0, 0, 0),
    a = c(2.7, 2.5, 0.6, 0.7, 0.9, 1.2, 5)
)

df$hubermean_if <- hubermean_if(x = df$x, y = df$y, a = df$a)

print(df)
}