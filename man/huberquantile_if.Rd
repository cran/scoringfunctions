\name{huberquantile_if}

\alias{huberquantile_if}

\title{
Huber quantile identification function
}

\description{
The function huberquantile_if computes the Huber quantile identification
function at a specific level \eqn{p} and parameters \eqn{a} and \eqn{b}, when
\eqn{y} materialises and \eqn{x} is the predictive Huber functional at level
\eqn{p}.

The Huber quantile identification function is defined by eq. (3.5) in Taggart
(2022).
}

\usage{
huberquantile_if(x, y, p, a, b)
}

\arguments{
\item{x}{Predictive Huber functional (prediction) at level \eqn{p}. It can be a
vector of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{p}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}

\item{a}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}

\item{b}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The Huber quantile identification function is defined by:

    \deqn{V(x, y, a) := |\textbf{1} \lbrace x \geq y \rbrace - p|
    \kappa_{a,b}(x - y)}

where \eqn{\kappa_{a,b}(t)} is the capping function defined by:

    \deqn{\kappa_{a,b}(t) := \max \lbrace \min \lbrace t,b \rbrace, -a \rbrace}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{0 < p < 1}

    \deqn{a > 0}

    \deqn{b > 0}
}

\value{
Vector of values of the Huber quantile identification function.
}

\note{
For the definition of Huber quantile, see Taggart (2022).

The Huber quantile identification function is a strict
\eqn{\mathbb{F}}-identification function for the Huber quantile functional
(Taggart 2022).

\eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for which
for which \eqn{\textnormal{E}_F[Y]} exists and is finite (Taggart 2022).
}

\references{
Taggart RJ (2022) Point forecasting and forecast evaluation with generalized
Huber loss. \emph{Electronic Journal of Statistics} \bold{16}:201--231.
\doi{10.1214/21-EJS1957}.
}

\examples{
# Compute the Huber quantile identification function.

set.seed(12345)

n <- 10

df <- data.frame(
    x = runif(n, -2, 2),
    y = runif(n, -2, 2),
    p = runif(n, 0, 1),
    a = runif(n, 0, 1),
    b = runif(n, 0, 1)
)

df$huberquantile_if <- huberquantile_if(x = df$x, y = df$y, p = df$p, a = df$a,
    b = df$b)

print(df)
}