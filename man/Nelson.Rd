%%% $Id: Nelson.Rd,v 1.1 1999/05/27 16:07:58 bates Exp $
\name{Nelson}
\alias{Nelson}
\non_function{}
\title{Dialectric breakdown data}
\description{
The \code{Nelson} data frame has 128 rows and 3 columns of data from an
accelerated test of dialectric breakdown.
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of dialectric breakdown strength values.
    }
    \item{x1}{
	A numeric vector of time values.
    }
    \item{x2}{
	A numeric vector of temperature values.
    }
}
\details{
These data are the result of a study involving
the analysis of performance degradation data from
accelerated tests, published in IEEE Transactions
on Reliability.  The response variable is dialectric
breakdown strength in kilo-volts, and the predictor
variables are time in weeks and temperature in degrees
Celsius.
}
\source{
Nelson, W. (1981).  
Analysis of Performance-Degradation Data.  
IEEE Transactions on Reliability.
Vol. 2, R-30, No. 2, pp. 149-155.
}
\examples{
library(NISTnls)
data(Nelson)
plot(y ~ x1, data = Nelson, log = "y")
plot(y ~ x2, data = Nelson, log = "y")
coplot(y ~ x1 | x2, data = Nelson)
coplot(y ~ x2 | x1, data = Nelson)
fm1 <- nls(log(y) ~ b1 - b2*x1 * exp(-b3*x2), data = Nelson,
           start = c(b1 = 2, b2 = 0.0001, b3 = -0.01), trace = TRUE,
           warnOnly = TRUE)
fm2 <- nls(log(y) ~ b1 - b2*x1 * exp(-b3*x2), data = Nelson,
           start = c(b1 = 2.5, b2 = 0.000000005, b3 = -0.05), trace = TRUE)
#fm3 <- nls(log(y) ~ cbind(1, -x1 * exp(-b3*x2)), data = Nelson,
#           start = c(b3 = -0.01), trace = TRUE, algorithm = "plinear",
#           warnOnly = TRUE)
#fm4 <- nls(log(y) ~ cbind(1, -x1 * exp(-b3*x2)), data = Nelson,
#           start = c(b3 = -0.05), trace = TRUE, algorithm = "plinear",
#           warnOnly = TRUE)
}
\keyword{datasets}
