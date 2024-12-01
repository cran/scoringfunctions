\name{nse}

\alias{nse}

\title{
Nash-Sutcliffe efficiency (NSE)
}

\description{
The function nse computes the Nash-Sutcliffe efficiency when
\eqn{\textbf{\textit{y}}} materialises and \eqn{\textbf{\textit{x}}} is the
prediction.

Nash-Sutcliffe efficiency is a skill score corresponding to the squared error
scoring function \link{serr_sf}. It is defined in eq. (3) in Nash and Sutcliffe
(1970).
}

\usage{
nse(x, y)
}

\arguments{
\item{x}{Prediction. It can be a vector of length \eqn{n} (must have the same
length as \eqn{\textbf{\textit{y}}}).}

\item{y}{Realisation (true value) of process. It can be a vector of length
\eqn{n} (must have the same length as \eqn{\textbf{\textit{x}}}).}
}

\details{
The Nash-Sutcliffe efficiency is defined by:

    \deqn{S_{\textnormal{skill}}(\textbf{\textit{x}}, \textbf{\textit{y}}) :=
    1 - S_{\textnormal{meth}}(\textbf{\textit{x}}, \textbf{\textit{y}}) /
    S_{\textnormal{ref}}(\textbf{\textit{x}}, \textbf{\textit{y}})}

    where

    \deqn{\textbf{\textit{x}} = (x_1, ..., x_n)^\mathsf{T}}

    \deqn{\textbf{\textit{y}} = (y_1, ..., y_n)^\mathsf{T}}

    \deqn{\textbf{1} = (1, ..., 1)^\mathsf{T}}

    \deqn{\overline{\textbf{\textit{y}}} :=
    (1/n) \textbf{1}^\mathsf{T} \textbf{\textit{y}} =
    (1/n) \sum_{i = 1}^{n} y_i}

    \deqn{L(x, y) := (x - y)^2}

    and the predictions of the method of interest as well as the reference
    method are evaluated respectively by:
    
    \deqn{S_{\textnormal{meth}}(\textbf{\textit{x}}, \textbf{\textit{y}}) :=
    (1/n) \sum_{i = 1}^{n} L(x_i, y_i)}
    
    \deqn{S_{\textnormal{ref}}(\textbf{\textit{x}}, \textbf{\textit{y}}) :=
    (1/n) \sum_{i = 1}^{n} L(\overline{\textbf{\textit{y}}}, y_i)}

Domain of function:

    \deqn{\textbf{\textit{x}} \in \mathbb{R}^n}

    \deqn{\textbf{\textit{y}} \in \mathbb{R}^n}
    
Range of function:

    \deqn{S(\textbf{\textit{x}}, \textbf{\textit{y}}) \leq 1,
    \forall \textbf{\textit{x}}, \textbf{\textit{y}} \in \mathbb{R}^n}
}

\value{
Value of the Nash-Sutcliffe efficiency.
}

\note{
For details on the squared error scoring function, see \link{serr_sf}.

The concept of skill scores is defined by Gneiting (2011).

The Nash-Sutcclife efficiency is defined in eq. (3) in Nash and Sutcliffe
(1970).

The Nash-Sutcclife efficiency is positevely oriented (i.e. the larger, the
better).
}

\references{
Gneiting T (2011) Making and evaluating point forecasts.
\emph{Journal of the American Statistical Association} \bold{106(494)}:746--762.
\doi{10.1198/jasa.2011.r10138}.

Nash JE, Sutcliffe JV (1970) River flow forecasting through conceptual models
part I - A discussion of principles. \emph{Journal of Hydrology}
\bold{10(3)}:282--290. \doi{10.1016/0022-1694(70)90255-6}.
}

\examples{
# Compute the Nash-Sutcliffe efficiency.

set.seed(12345)

x <- 0

y <- rnorm(n = 100, mean = 0, sd = 1)

print(nse(x = x, y = y))

print(nse(x = rep(x = x, times = 100), y = y))

print(nse(x = mean(y), y = y))

print(nse(x = y, y = y))
}