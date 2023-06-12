\name{sperr_sf}

\alias{sperr_sf}

\title{
Squared percentage error scoring function
}

\description{
The function sperr_sf computes the squared percentage error scoring function
when \eqn{y} materializes and \eqn{x} is the predictive
\eqn{\dfrac{\textnormal{E}_F [Y^{-1}]}{\textnormal{E}_F [Y^{-2}]}} functional.

The squared percentage error scoring function is defined in p. 752 in
Gneiting (2011).
}

\usage{
sperr_sf(x, y)
}

\arguments{
\item{x}{Predictive \eqn{\dfrac{\textnormal{E}_F [Y^{-1}]}{\textnormal{E}_F [Y^{-2}]}}
functional (prediction). It can be a vector of length \eqn{n} (must have the
same length as \eqn{y}).}

\item{y}{Realization (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{x}).}
}

\details{
The squared percentage error scoring function is defined by:

    \deqn{S(x, y) := ((x - y)/y)^{2}}

Domain of function:

    \deqn{x > 0}

    \deqn{y > 0}
    
Range of function:

    \deqn{S(x, y) \geq 0, \forall x, y > 0}
}

\value{
Vector of squared percentage errors.
}

\note{
For details on the squared percentage error scoring function, see
Park and Stefanski (1998) and Gneiting (2011).

The squared percentage error scoring function is negatively oriented (i.e. the
smaller, the better).

The squared percentage error scoring function is strictly consistent for the
\eqn{\dfrac{\textnormal{E}_F [Y^{-1}]}{\textnormal{E}_F [Y^{-2}]}} functional.
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Park H, Stefanski LA (1998) Relative-error prediction.
\emph{Statistics and Probability Letters} \bold{40(3)}:227--236.
\doi{10.1016/S0167-7152(98)00088-1}.
}

\examples{
# Compute the squared percentage error scoring function.

df <- data.frame(
    y = rep(x = 2, times = 3),
    x = 1:3
)

df$squared_percentage_error <- sperr_sf(x = df$x, y = df$y)

print(df)
}