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

        \item 1. Scoring functions

        \item 1.1. Consistent scoring functions for one-dimensional functionals

        \item 1.2. Consistent scoring functions for two-dimensional functionals
        
        \item 1.3. Consistent scoring functions for multi-dimensional
            functionals

        \item 2. Realised (average) score functions

        \item 2.1 Realised (average) score functions for one-dimensional
            functionals
        
        \item 3. Skill score functions

        \item 3.1 Skill score functions for one-dimensional functionals

        \item 4. Identification functions

        \item 4.1. Identification functions for one-dimensional functionals

        \item 4.2. Identification functions for two-dimensional functionals

        \item 5. Functions for sample levels

        \item 6. Supporting functions
    }
.
}

\section{1. Scoring functions}{

\subsection{1.1. Consistent scoring functions for one-dimensional functionals}{

\eqn{\textit{1.1.1. Consistent scoring functions for the mean}}

    \code{\link{bregman1_sf}}: Bregman scoring function (type 1)

    \code{\link{bregman2_sf}}: Bregman scoring function (type 2, Patton scoring
        function)

    \code{\link{bregman3_sf}}: Bregman scoring function (type 3, QLIKE scoring
        function)

    \code{\link{bregman4_sf}}: Bregman scoring function (type 4, Patton scoring
        function)

    \code{\link{serr_sf}}: Squared error scoring function

\eqn{\textit{1.1.2. Consistent scoring functions for expectiles}}

    \code{\link{expectile_sf}}: Asymmetric piecewise quadratic scoring function
        (expectile scoring function, expectile loss function)

\eqn{\textit{1.1.3. Consistent scoring functions for the median}}

    \code{\link{aerr_sf}}: Absolute error scoring function

    \code{\link{maelog_sf}}: MAE-LOG scoring function
    
    \code{\link{maesd_sf}}: MAE-SD scoring function

\eqn{\textit{1.1.4. Consistent scoring functions for quantiles}}

    \code{\link{gpl1_sf}}: Generalized piecewise linear power scoring function
        (type 1)

    \code{\link{gpl2_sf}}: Generalized piecewise linear power scoring function
        (type 2)

    \code{\link{quantile_sf}}: Asymmetric piecewise linear scoring function
        (quantile scoring function, quantile loss function)

\eqn{\textit{1.1.5. Consistent scoring functions for Huber functionals}}

    \code{\link{ghuber_sf}}: Generalized Huber scoring function
    
    \code{\link{huber_sf}}: Huber scoring function

\eqn{\textit{1.1.6. Consistent scoring functions for other functionals}}

    \code{\link{aperr_sf}}: Absolute percentage error scoring function

    \code{\link{bmedian_sf}}: \eqn{\beta}-median scoring function

    \code{\link{linex_sf}}: LINEX scoring function

    \code{\link{lqmean_sf}}: \eqn{L_q}-mean scoring function

    \code{\link{lqquantile_sf}}: \eqn{L_q}-quantile scoring function

    \code{\link{nmoment_sf}}: \eqn{n}-th moment scoring function

    \code{\link{obsweighted_sf}}: Observation-weighted scoring function

    \code{\link{relerr_sf}}: Relative error scoring function (MAE-PROP scoring
        function)

    \code{\link{serrexp_sf}}: Squared error exp scoring function

    \code{\link{serrlog_sf}}: Squared error log scoring function

    \code{\link{serrpower_sf}}: Squared error of power transformations scoring
        function

    \code{\link{serrsq_sf}}: Squared error of squares scoring function

    \code{\link{sperr_sf}}: Squared percentage error scoring function

    \code{\link{srelerr_sf}}: Squared relative error scoring function
}

\subsection{1.2. Consistent scoring functions for two-dimensional functionals}{

    \code{\link{interval_sf}}: Interval scoring function (Winkler scoring
        function)

    \code{\link{mv_sf}}: Mean - variance scoring function
}

\subsection{1.3. Consistent scoring functions for multi-dimensional functionals}{

    \code{\link{errorspread_sf}}: Error - spread scoring function
}
}

\section{2. Realised (average) score functions}{

\subsection{2.1. Realised (average) score functions for one-dimensional functionals}{

\eqn{\textit{2.1.1. Realised (average) score functions for the mean}}

    \code{\link{mse}}: Mean squared error (MSE)
    
\eqn{\textit{2.1.2. Realised (average) score functions for expectiles}}

    \code{\link{expectile_rs}}: Realised expectile score
    
\eqn{\textit{2.1.3. Realised (average) score functions for the median}}

    \code{\link{mae}}: Mean absolute error (MAE)

\eqn{\textit{2.1.4. Realised (average) score functions for quantiles}}

    \code{\link{quantile_rs}}: Realised quantile score

\eqn{\textit{2.1.5. Realised (average) score functions for Huber functionals}}

    \code{\link{huber_rs}}: Mean Huber score

\eqn{\textit{2.1.6. Realised (average) score functions for other functionals}}

    \code{\link{mape}}: Mean absolute percentage error (MAPE)

    \code{\link{mre}}: Mean relative error (MRE)

    \code{\link{mspe}}: Mean squared percentage error (MSPE)

    \code{\link{msre}}: Mean squared relative error (MSRE)
}
}

\section{3. Skill score functions}{

\subsection{3.1. Skill score functions for one-dimensional functionals}{

\eqn{\textit{3.1.1. Skill score functions for the mean}}

    \code{\link{nse}}: Nash-Sutcliffe efficiency (NSE)
}
}

\section{4. Identification functions}{

\subsection{4.1. Identification functions for one-dimensional functionals}{

    \code{\link{expectile_if}}: Expectile identification function
    
    \code{\link{hubermean_if}}: Huber mean identification function

    \code{\link{huberquantile_if}}: Huber quantile identification function

    \code{\link{mean_if}}: Mean identification function

    \code{\link{meanlog_if}}: Log-transformed identification function

    \code{\link{nmoment_if}}: \eqn{n}-th moment identification function

    \code{\link{quantile_if}}: Quantile identification function
}

\subsection{4.2. Identification functions for two-dimensional functionals}{

    \code{\link{mv_if}}: Mean - variance identification function
}
}

\section{5. Functions for sample levels}{

    \code{\link{quantile_level}}: Sample quantile level function
}

\section{6. Supporting functions}{

    \code{\link{capping_function}}: Capping function
}