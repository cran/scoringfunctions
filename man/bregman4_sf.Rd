\name{bregman4_sf}

\alias{bregman4_sf}

\title{
Bregman scoring function (type 4, Patton scoring function)
}

\description{
The function bregman4_sf computes the Bregman scoring function when \eqn{y}
materialises and \eqn{x} is the predictive mean functional.

The Bregman scoring function is defined by eq. (18) in Gneiting (2011) and the
form implemented here for \eqn{\phi(x) = x \log(x)} is defined by eq. (20) in
Gneiting (2011).
}

\usage{
bregman4_sf(x, y)
}

\arguments{
\item{x}{Predictive mean functional (prediction). It can be a vector of length
\eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The Bregman scoring function (type 4) is defined by:

    \deqn{S(x, y) := y \log(y/x) - y + x}

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y > 0}
}

\value{
Vector of Bregman losses.
}

\note{
The implemented function is denoted as type 4 since it corresponds to a specific
type of \eqn{\phi(x)} of the general form of the Bregman scoring function
defined by eq. (18) in Gneiting (2011).

For details on the Bregman scoring function, see Savage (1971), Banerjee et al.
(2005) and Gneiting (2011). For details on the specific form implemented here,
see Patton (2011).

The mean functional is the mean \eqn{\textnormal{E}_F[Y]} of the probability
distribution \eqn{F} of \eqn{y} (Gneiting 2011).

The Bregman scoring function is negatively oriented (i.e. the smaller, the
better).

The herein implemented Bregman scoring function is strictly
\eqn{\mathbb{F}}-consistent for the mean functional. \eqn{\mathbb{F}} is the
family of probability distributions \eqn{F} for which \eqn{\textnormal{E}_F[Y]}
and \eqn{\textnormal{E}_F[Y \log(Y)]} exist and are finite (Savage 1971;
Gneiting 2011).
}

\references{
Banerjee A, Guo X, Wang H (2005) On the optimality of conditional expectation as
a Bregman predictor. \emph{IEEE Transactions on Information Theory}
\bold{51(7)}:2664--2669. \doi{10.1109/TIT.2005.850145}.

Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Patton AJ (2011) Volatility forecast comparison using imperfect volatility
proxies. \emph{Journal of Econometrics} \bold{160(1)}:246--256.
\doi{10.1016/j.jeconom.2010.03.034}.

Savage LJ  (1971) Elicitation of personal probabilities and expectations.
\emph{Journal of the American Statistical Association} \bold{66(337)}:783--810.
\doi{10.1080/01621459.1971.10482346}.
}

\examples{
# Compute the Bregman scoring function (type 4).

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3
)

df$bregman4_penalty <- bregman4_sf(x = df$x, y = df$y)

print(df)
}