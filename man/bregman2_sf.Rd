\name{bregman2_sf}

\alias{bregman2_sf}

\title{
Bregman scoring function (type 2, Patton scoring function)
}

\description{
The function bregman2_sf computes the Bregman scoring function when \eqn{y}
materialises and \eqn{x} is the predictive mean functional.

The Bregman scoring function is defined by eq. (18) in Gneiting (2011) and the
form implemented here for \eqn{\phi(x) = \dfrac{1}{b (b - 1)} x^b},
\eqn{b \in \R \setminus \lbrace 0, 1 \rbrace} is defined by eq. (20) in Gneiting
(2011).
}

\usage{
bregman2_sf(x, y, b)
}

\arguments{
\item{x}{Predictive mean functional (prediction). It can be a vector of length
\eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{b}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The Bregman scoring function (type 2) is defined by:

    \deqn{
        S(x, y, b) := \dfrac{1}{b (b - 1)} (y^b - x^b) -
            \dfrac{1}{b - 1} x^{b - 1} (y - x)
    }

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}

    \deqn{b \in \mathbb{R} \setminus \lbrace 0, 1 \rbrace}
    
Range of function:

    \deqn{S(x, y, b) \geq 0, \forall x, y > 0, b \in \mathbb{R} \setminus
        \lbrace 0, 1 \rbrace}
}

\value{
Vector of Bregman losses.
}

\note{
The implemented function is denoted as type 2 since it corresponds to a specific
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
and \eqn{\textnormal{E}_F[\dfrac{1}{b (b - 1)} Y^b]} exist and are finite
(Savage 1971; Gneiting 2011).
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
# Compute the Bregman scoring function (type 2).

df <- data.frame(
    y = rep(x = 2, times = 6),
    x = rep(x = 1:3, times = 2),
    b = rep(x = c(-3, 3), each = 3)
)

df$bregman2_penalty <- bregman2_sf(x = df$x, y = df$y, b = df$b)

print(df)

# The Bregman scoring function (type 2) is half the squared error scoring
# function, when b = 2.

df <- data.frame(
    y = rep(x = 5.5, times = 10),
    x = 1:10,
    b = rep(x = 2, times = 10)
)

df$bregman2_penalty <- bregman2_sf(x = df$x, y = df$y, b = df$b)

df$squared_error <- serr_sf(x = df$x, y = df$y)

df$ratio <- df$bregman2_penalty/df$squared_error

print(df)


# When a = b > 1 the Bregman scoring function (type 2) coincides with the
# Bregman scoring function (type 1) up to a multiplicative constant.

df <- data.frame(
    y = rep(x = 5.5, times = 10),
    x = 1:10,
    b = rep(x = c(3, 4), each = 5)
)

df$bregman2_penalty <- bregman2_sf(x = df$x, y = df$y, b = df$b)

df$bregman1_penalty <- bregman1_sf(x = df$x, y = df$y, a = df$b)

df$ratio <- df$bregman2_penalty/df$bregman1_penalty

print(df)
}