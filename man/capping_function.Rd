\name{capping_function}

\alias{capping_function}

\title{
Capping function
}

\description{
The function capping_function computes the value of the capping function,
defined in Taggart (2022), p.205.

It is used by the generalized Huber loss function among others (see Taggart
2022).
}

\usage{
capping_function(t, a, b)
}

\arguments{
\item{t}{It can be a vector of length \eqn{n}.}

\item{a}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{t}).}

\item{b}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{t}).}
}

\details{
The capping function \eqn{\kappa_{a,b}(t)} is defined by:
    
    \deqn{\kappa_{a,b}(t) := \max \lbrace \min \lbrace t,b \rbrace, -a \rbrace}

Domain of function:

    \deqn{t \in \R}

    \deqn{a \geq 0}

    \deqn{b \geq 0}
}

\value{
Vector of values of the capping function.
}

\note{
For the definition of the capping function, see Taggart (2022), p.205.
}

\references{
Taggart RJ (2022) Point forecasting and forecast evaluation with generalized
Huber loss. \emph{Electronic Journal of Statistics} \bold{16}:201--231.
\doi{10.1214/21-EJS1957}.
}

\examples{
# Compute the capping function.

df <- data.frame(
    t = c(1, -1, 1, -1, 1, -1, 1, -1, 1, 1, 2.5, 2.5, 3.5, 3.5),
    a = c(0, 0, 0, 0, Inf, Inf, Inf, Inf, 2, 3, 2, 3, 2, 3),
    b = c(0, 0, Inf, Inf, 0, 0, Inf, Inf, 3, 2, 3, 2, 3, 2)
)

df$cf <- capping_function(t = df$t, a = df$a, b = df$b)

print(df)
}