\name{interval_sf}

\alias{interval_sf}

\title{
Interval scoring function (Winkler scoring function)
}

\description{
The function interval_sf computes the interval scoring function (Winkler scoring
function) when \eqn{y} materialises and \eqn{[x_1, x_2]} is the central
\eqn{1 - p} prediction interval.

The interval scoring function is defined by eq. (43) in Gneiting and Raftery
(2007).
}

\usage{
interval_sf(x1, x2, y, p)
}

\arguments{
\item{x1}{Predictive quantile (prediction) at level \eqn{p/2}. It can be a
vector of length \eqn{n} (must have the same length as \eqn{y}).}

\item{x2}{Predictive quantile (prediction) at level \eqn{1 - p/2}. It can be a
vector of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x_1}).}

\item{p}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The interval scoring function is defined by:

    \deqn{
        S(x_1, x_2, y, p) := (x_2 - x_1) +
            (2/p) (x_1 - y) \textbf{1} \lbrace y < x_1 \rbrace +
            (2/p) (y - x_2) \textbf{1} \lbrace y > x_2 \rbrace
    }

Domain of function:

    \deqn{x_1 \in \mathbb{R}}
    
    \deqn{x_2 \in \mathbb{R}}
    
    \deqn{x_1 < x_2}

    \deqn{y \in \mathbb{R}}

    \deqn{0 < p < 1}

Range of function:

    \deqn{S(x_1, x_2, y, p) \geq 0, \forall x_1, x_2, y \in \mathbb{R},
    x_1 < x_2, p \in (0, 1)}
    }

\value{
Vector of interval losses.
}

\note{
For the definition of quantiles, see Koenker and Bassett Jr (1978).

The interval scoring function is negatively oriented (i.e. the smaller, the
better).

The interval scoring function is strictly \eqn{\mathbb{F}}-consistent for the
central \eqn{1 - p} prediction interval \eqn{[x_1, x_2]}. \eqn{x_1} and
\eqn{x_2} are quantile functionals at levels \eqn{p/2} and \eqn{1 - p/2}
respectively.

\eqn{\mathbb{F}} is the family of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[Y]} exists and is finite (Dunsmore 1968; Winkler 1972;
Gneiting and Raftery 2007; Winkler and Murphy 1979; Fissler and Ziegel 2016;
Brehmer and Gneiting 2021).
}

\references{
Brehmer JR, Gneiting T (2021) Scoring interval forecasts: Equal-tailed,
shortest, and modal interval. \emph{Bernoulli} \bold{27(3)}:1993--2010.
\doi{10.3150/20-BEJ1298}.

Dunsmore IR (1968) A Bayesian approach to calibration.
\emph{Journal of the Royal Statistical Society: Series B (Statistical Methodology)}
\bold{30(2)}:396--405. \doi{10.1111/j.2517-6161.1968.tb00740.x}.

Fissler T, Ziegel JF (2016) Higher order elicitability and Osband's principle.
\emph{The Annals of Statistics} \bold{44(4)}:1680--1707.
\doi{10.1214/16-AOS1439}.

Gneiting T, Raftery AE (2007) Strictly proper scoring rules, prediction, and
estimation. \emph{Journal of the American Statistical Association}
\bold{102(477)}:359--378. \doi{10.1198/016214506000001437}.

Koenker R, Bassett Jr G (1978) Regression quantiles. \emph{Econometrica}
\bold{46(1)}:33--50. \doi{10.2307/1913643}.

Winkler RL (1972) A decision-theoretic approach to interval estimation.
\emph{Journal of the American Statistical Association} \bold{67(337)}:187--191.
\doi{10.1080/01621459.1972.10481224}.

Winkler RL, Murphy AH (1979) The use of probabilities in forecasts of maximum
and minimum temperatures.\emph{Meteorological Magazine}
\bold{108(1288)}:317--329.
}

\examples{
# Compute the interval scoring function (Winkler scoring function).

df <- data.frame(
    y = rep(x = 0, times = 6),
    x1 = c(-3, -2, -1, 0, 1, 2),
    x2 = c(1, 2, 3, 4, 5, 6),
    p = rep(x = c(0.05, 0.95), times = 3)
)

df$interval_penalty <- interval_sf(x1 = df$x1, x2 = df$x2, y = df$y, p = df$p)

print(df)
}