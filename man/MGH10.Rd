%%% $Id: MGH10.Rd,v 1.1 1999/05/27 16:07:58 bates Exp $
\name{MGH10}
\alias{MGH10}
\non_function{}
\title{More, Gabrow and Hillstrom example 10}
\description{
The \code{MGH10} data frame has 16 rows and 2 columns.
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
Meyer, R. R. (1970).  
Theoretical and computational aspects of nonlinear 
regression.  In Nonlinear Programming, Rosen, 
Mangasarian and Ritter (Eds).  
New York, NY: Academic Press, pp. 465-486.
}
\examples{
library(NISTnls)
data(MGH10)
plot(y ~ x, data = MGH10)
## check plot on log scale for shape
plot(y ~ x, data = MGH10, log = "y")
## starting values for this run are ridiculous
fm1 <- nls(y ~ b1 * exp(b2/(x+b3)), data = MGH10, trace = TRUE,
           start = c(b1 = 2, b2 = 400000, b3 = 25000),
           warnOnly = TRUE)
fm2 <- nls(y ~ b1 * exp(b2/(x+b3)), data = MGH10, trace = TRUE,
           start = c(b1 = 0.02, b2 = 4000, b3 = 250),
           warnOnly = TRUE)
fm3 <- nls(y ~ exp(b2/(x+b3)), data = MGH10, trace = TRUE,
           start = c(b2 = 400000, b3 = 25000),
           warnOnly = TRUE, algorithm = "plinear")
fm4 <- nls(y ~ exp(b2/(x+b3)), data = MGH10, trace = TRUE,
           start = c(b2 = 4000, b3 = 250),
           warnOnly = TRUE, algorithm = "plinear")
}
\author{}
\keyword{datasets}
