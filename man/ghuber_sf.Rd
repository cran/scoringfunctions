\name{ghuber_sf}

\alias{ghuber_sf}

\title{
Generalized Huber scoring function
}

\description{
The function ghuber_sf computes the generalized Huber scoring function at a
specific level \eqn{p} and parameters \eqn{a} and \eqn{b}, when \eqn{y}
materialises and \eqn{x} is the predictive Huber functional at level \eqn{p}.

The generalized Huber scoring function is defined by eq. (4.7) in Taggart (2022)
for \eqn{\phi(t) = t^2}.
}

\usage{
ghuber_sf(x, y, p, a, b)
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
The generalized Huber scoring function is defined by:

    \deqn{
        S(x, y, p, a, b) := |\textbf{1} \lbrace x \geq y \rbrace - p|
            (y^2 - (\kappa_{a,b}(x - y) + y)^2 + 2 x \kappa_{a,b}(x - y))
    }

or equivalently

    \deqn{
        S(x, y, p, a, b) :=
        |\textbf{1} \lbrace x \geq y \rbrace - p| f_{a,b}(x - y)
    }

or

    \deqn{
        S(x, y, p, a, b) :=
        p f_{a,b}(- \max \lbrace -(x - y), 0 \rbrace) +
        (1 - p) f_{a,b}(\max \lbrace x - y, 0 \rbrace)
    }

where

    \deqn{f_{a,b}(t) := \kappa_{a,b}(t) (2 t - \kappa_{a,b}(t))}

and \eqn{\kappa_{a,b}(t)} is the capping function defined by:

    \deqn{\kappa_{a,b}(t) := \max \lbrace \min \lbrace t,b \rbrace, -a \rbrace}

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{0 < p < 1}

    \deqn{a > 0}

    \deqn{b > 0}
    
Range of function:

    \deqn{S(x, y, p, a, b) \geq 0, \forall x, y \in \mathbb{R}, p \in (0, 1), a, b > 0}
}

\value{
Vector of generalized Huber losses.
}

\note{
For the definition of Huber functionals, see definition 3.3 in Taggart (2022).
The value of eq. (4.7) is twice the value of the equation in definition 4.2 in
Taggart (2002).

The generalized Huber scoring function is negatively oriented (i.e. the smaller,
the better).

The generalized Huber scoring function is strictly \eqn{\mathbb{F}}-consistent
for the \eqn{p}-Huber functional. \eqn{\mathbb{F}} is the family of probability
distributions \eqn{F} for which \eqn{\textnormal{E}_F[Y^2 - (Y - a)^2]} and
\eqn{\textnormal{E}_F[Y^2 - (Y + b)^2]} (or equivalently
\eqn{\textnormal{E}_F[Y]}) exist and are finite (Taggart 2022).
}

\references{
Taggart RJ (2022) Point forecasting and forecast evaluation with generalized
Huber loss. \emph{Electronic Journal of Statistics} \bold{16}:201--231.
\doi{10.1214/21-EJS1957}.
}

\examples{
# Compute the generalized Huber scoring function.

set.seed(12345)

n <- 10

df <- data.frame(
    x = runif(n, -2, 2),
    y = runif(n, -2, 2),
    p = runif(n, 0, 1),
    a = runif(n, 0, 1),
    b = runif(n, 0, 1)
)

df$ghuber_penalty <- ghuber_sf(x = df$x, y = df$y, p = df$p, a = df$a, b = df$b)

print(df)

# Equivalence of the generalized Huber scoring function and the asymmetric
# piecewise quadratic scoring function (expectile scoring function), when
# a = Inf and b = Inf.

set.seed(12345)

n <- 100

x <- runif(n, -20, 20)
y <- runif(n, -20, 20)
p <- runif(n, 0, 1)
a <- rep(x = Inf, times = n)
b <- rep(x = Inf, times = n)

u <- ghuber_sf(x = x, y = y, p = p, a = a, b = b)
v <- expectile_sf(x = x, y = y, p = p)

max(abs(u - v)) # values are slightly higher than 0 due to rounding error
min(abs(u - v))

# Equivalence of the generalized Huber scoring function and the Huber scoring
# function when p = 1/2 and a = b.

set.seed(12345)

n <- 100

x <- runif(n, -20, 20)
y <- runif(n, -20, 20)
p <- rep(x = 1/2, times = n)
a <- runif(n, 0, 20)

u <- ghuber_sf(x = x, y = y, p = p, a = a, b = a)
v <- huber_sf(x = x, y = y, a = a)

max(abs(u - v)) # values are slightly higher than 0 due to rounding error
min(abs(u - v))
}