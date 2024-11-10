\name{scoringfunctions-package}

\alias{scoringfunctions-package}

\docType{package}

\title{ 
Overview of the functions in the scoringfunctions package
}

\description{
The scoringfunctions package implements consistent scoring (loss) functions and
identification functions
}

\details{
The package functions are categorized into the following classes:

    \itemize{

        \item Consistent scoring functions for one-dimensional functionals

        \item Consistent scoring functions for two-dimensional functionals

        \item Identification functions for one-dimensional functionals

        \item Supporting functions
    }
.
}

\section{1. Consistent scoring functions for one-dimensional functionals}{

    \code{\link{aerr_sf}}: Absolute error scoring function

    \code{\link{aperr_sf}}: Absolute percentage error scoring function

    \code{\link{bmedian_sf}}: \eqn{\beta}-median scoring function

    \code{\link{bregman1_sf}}: Bregman scoring function (type 1)

    \code{\link{bregman2_sf}}: Bregman scoring function (type 2, Patton scoring
        function)

    \code{\link{bregman3_sf}}: Bregman scoring function (type 3, QLIKE scoring
        function)

    \code{\link{bregman4_sf}}: Bregman scoring function (type 4, Patton scoring
        function)

    \code{\link{expectile_sf}}: Asymmetric piecewise quadratic scoring function
        (expectile scoring function, expectile loss function)

    \code{\link{ghuber_sf}}: Generalized Huber scoring function

    \code{\link{gpl1_sf}}: Generalized piecewise linear power scoring function
        (type 1)

    \code{\link{gpl2_sf}}: Generalized piecewise linear power scoring function
        (type 2)

    \code{\link{huber_sf}}: Huber scoring function

    \code{\link{maelog_sf}}: MAE-LOG scoring function

    \code{\link{maesd_sf}}: MAE-SD scoring function

    \code{\link{nmoment_sf}}: \eqn{n}-th moment scoring function

    \code{\link{obsweighted_sf}}: Observation-weighted scoring function

    \code{\link{quantile_sf}}: Asymmetric piecewise linear scoring function
        (quantile scoring function, quantile loss function)

    \code{\link{relerr_sf}}: Relative error scoring function (MAE-PROP scoring
        function)

    \code{\link{serr_sf}}: Squared error scoring function

    \code{\link{sperr_sf}}: Squared percentage error scoring function

    \code{\link{srelerr_sf}}: Squared relative error scoring function
}

\section{2. Consistent scoring functions for two-dimensional functionals}{

    \code{\link{interval_sf}}: Interval scoring function (Winkler scoring
        function)

    \code{\link{mv_sf}}: Mean - variance scoring function
}

\section{3. Identification functions for one-dimensional functionals}{

    \code{\link{expectile_if}}: Expectile identification function

    \code{\link{mean_if}}: Mean identification function

    \code{\link{nmoment_if}}: \eqn{n}-th moment identification function

    \code{\link{quantile_if}}: Quantile identification function
}

\section{4. Identification functions for two-dimensional functionals}{

    \code{\link{mv_if}}: Mean - variance identification function
}

\section{5. Supporting functions}{

    \code{\link{capping_function}}: Capping function
}