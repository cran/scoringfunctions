\name{bregman1_sf}

\alias{bregman1_sf}

\title{
Bregman scoring function (type 1)
}

\description{
The function bregman1_sf computes the Bregman scoring function when \eqn{y}
materializes and \eqn{x} is the predictive mean functional.

The Bregman scoring function is defined by eq. (18) in Gneiting (2011) and the
form implemented here for \eqn{\phi(x) = |x|^a} is defined by eq. (19) in
Gneiting (2011).
}

\usage{
bregman1_sf(x, y, a)
}

\arguments{
\item{x}{Predictive mean functional (prediction). It can be a vector of length
\eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{a}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The Bregman scoring function (type 1) is defined by:

    \deqn{
        S(x, y, a) := |y|^a - |x|^a - a \textnormal{sign}(x) |x|^{a - 1} (y - x)
    }

Domain of function:

    \deqn{x \in \R}

    \deqn{y \in \R}

    \deqn{a > 1}
    
Range of function:

    \deqn{S(x, y, a) \geq 0, \forall x, y \in \R, a > 1}
}

\value{
Vector of Bregman losses.
}

\note{
The implemented function is denoted as type 1 since it corresponds to a specific
type of \eqn{\phi(x)} of the general form of the Bregman scoring function
defined by eq. (18) in Gneiting (2011).

For details on the Bregman scoring function, see Savage 1971, Banerjee et al.
(2005) and Gneiting (2011).

The mean functional is the mean \eqn{E_F[Y]} of the probability distribution
\eqn{F} of \eqn{y} (Gneiting 2011).

The Bregman scoring function is negatively oriented (i.e. the smaller, the
better).

The herein implemented Bregman scoring function is strictly consistent for the
mean functional relative to the family \eqn{\mathbb{F}} of potential probability
distributions \eqn{F} for the future \eqn{y} for which \eqn{E_F[Y]} and
\eqn{E_F[|Y|^a]} exist and are finite (Savage 1971, Gneiting 2011).
}

\references{
Banerjee A, Guo X, Wang H (2005) On the optimality of conditional expectation as
a Bregman predictor. \emph{IEEE Transactions on Information Theory}
\bold{51(7)}:2664--2669. \doi{10.1109/TIT.2005.850145}.

Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Savage LJ  (1971) Elicitation of personal probabilities and expectations.
\emph{Journal of the American Statistical Association} \bold{66(337)}:783--810.
\doi{10.1080/01621459.1971.10482346}.
}

\examples{
# Compute the Bregman scoring function (type 1).

df <- data.frame(
    y = rep(x = 0, times = 7),
    x = c(-3, -2, -1, 0, 1, 2, 3),
    a = rep(x = 3, times = 7)
)

df$bregman1_penalty <- bregman1_sf(x = df$x, y = df$y, a = df$a)

print(df)

# Equivalence of Bregman scoring function (type 1) and squared error scoring
# function, when a = 2.

set.seed(12345)

n <- 100

x <- runif(n, -20, 20)
y <- runif(n, -20, 20)
a <- rep(x = 2, times = n)

u <- bregman1_sf(x = x, y = y, a = a)

v <- serr_sf(x = x, y = y)

max(abs(u - v)) # values are slightly higher than 0 due to rounding error
min(abs(u - v))
}