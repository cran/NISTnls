%%% $Id: MGH17.Rd,v 1.1 1999/05/27 16:07:58 bates Exp $
\name{MGH17}
\alias{MGH17}
\non_function{}
\title{More, Gabrow and Hillstrom example 17}
\description{
The \code{MGH17} data frame has 33 rows and 2 columns
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of response values.
    }
    \item{x}{
	A numeric vector of input values.
    }
}
\details{
This problem was found to be difficult for some very
good algorithms.

See More, J. J., Garbow, B. S., and Hillstrom, K. E.
(1981).  Testing unconstrained optimization software.
ACM Transactions on Mathematical Software. 7(1):
pp. 17-41.
}
\source{
Osborne, M. R. (1972).  
Some aspects of nonlinear least squares 
calculations.  In Numerical Methods for Nonlinear 
Optimization, Lootsma (Ed).  
New York, NY:  Academic Press, pp. 171-189.
 }
\examples{
library(NISTnls)
data(MGH17)
plot(y ~ x, data = MGH17)
## Another set of absurd starting values
#fm1 <- nls(y ~ b1 + b2*exp(-x*b4) + b3*exp(-x*b5),
#           data = MGH17, trace = TRUE,
#           start = c(b1 = 50, b2 = 150, b3 = -100, b4 = 1, b5 = 2),
#           warnOnly = TRUE)
fm2 <- nls(y ~ b1 + b2*exp(-x*b4) + b3*exp(-x*b5),
           data = MGH17, trace = TRUE,
           start = c(b1 = 0.5, b2 = 1.5, b3 = -1, b4 = 0.01, b5 = 0.02),
           warnOnly = TRUE)
#fm3 <- nls(y ~ cbind(1, exp(-x*b4), exp(-x*b5)),
#           data = MGH17, trace = TRUE, algorithm = "plinear",
#           start = c(b4 = 1, b5 = 2),
#           warnOnly = TRUE)
fm4 <- nls(y ~ cbind(1, exp(-x*b4), exp(-x*b5)),
           data = MGH17, trace = TRUE, algorithm = "plinear",
           start = c(b4 = 0.01, b5 = 0.02),
           warnOnly = TRUE)
}
\keyword{datasets}
