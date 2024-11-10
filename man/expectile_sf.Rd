\name{expectile_sf}

\alias{expectile_sf}

\title{
Asymmetric piecewise quadratic scoring function (expectile scoring function,
expectile loss function)
}

\description{
The function expectile_sf computes the asymmetric piecewise quadratic scoring
function (expectile scoring function) at a specific level \eqn{p}, when
\eqn{y} materializes and \eqn{x} is the predictive expectile at level
\eqn{p}.

The asymmetric piecewise quadratic scoring function is defined by eq. (27) in
Gneiting (2011).
}

\usage{
expectile_sf(x, y, p)
}

\arguments{
\item{x}{Predictive expectile (prediction) at level \eqn{p}. It can be a vector
of length \eqn{n} (must have the same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}

\item{p}{It can be a vector of length \eqn{n} (must have the same length as
\eqn{y}).}
}

\details{
The asymmetric piecewise quadratic scoring function is defined by:

    \deqn{
        S(x, y, p) := |\textbf{1} \lbrace x \geq y \rbrace - p| (x - y)^2
    }

or equivalently,

    \deqn{
        S(x, y, p) := p (\max \lbrace -(x - y), 0 \rbrace)^2 +
        (1 - p) (\max \lbrace x - y, 0 \rbrace)^2
    }

Domain of function:

    \deqn{x \in \mathbb{R}}

    \deqn{y \in \mathbb{R}}

    \deqn{0 < p < 1}
    
Range of function:

    \deqn{S(x, y, p) \geq 0, \forall x, y \in \mathbb{R}, p \in (0, 1)}
}

\value{
Vector of expectile losses.
}

\note{
For the definition of expectiles, see Newey and Powell (1987).

The asymmetric piecewise quadratic scoring function is negatively oriented (i.e.
the smaller, the better).

The asymmetric piecewise quadratic scoring function is strictly
\eqn{\mathbb{F}}-consistent for the \eqn{p}-expectile functional.
\eqn{\mathbb{F}} is the family  of probability distributions \eqn{F} for which
\eqn{\textnormal{E}_F[Y^2]} exists and is finite (Gneiting 2011).
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Newey WK, Powell JL (1987) Asymmetric least squares estimation and testing.
\emph{Econometrica} \bold{55(4)}:819--847.
\doi{10.2307/1911031}.
}

\examples{
# Compute the asymmetric piecewise quadratic scoring function (expectile scoring
# function).

df <- data.frame(
    y = rep(x = 0, times = 6),
    x = c(2, 2, -2, -2, 0, 0),
    p = rep(x = c(0.05, 0.95), times = 3)
)

df$expectile_penalty <- expectile_sf(x = df$x, y = df$y, p = df$p)

print(df)

# The asymmetric piecewise quadratic scoring function (expectile scoring
# function) at level p = 0.5 is half the squared error scoring function.

df <- data.frame(
    y = rep(x = 0, times = 3),
    x = c(-2, 0, 2),
    p = rep(x = c(0.5), times = 3)
)

df$expectile_penalty <- expectile_sf(x = df$x, y = df$y, p = df$p)

df$squared_error <- serr_sf(x = df$x, y = df$y)

print(df)
}