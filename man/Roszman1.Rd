%%% $Id: Roszman1.Rd,v 1.1 1999/05/27 16:07:58 bates Exp $
\name{Roszman1}
\alias{Roszman1}
\non_function{}
\title{Quantum defects in iodine}
\description{
The \code{Roszman1} data frame has 25 rows and 2 columns of data on the
number of quantum defects in iodine atoms at different energy states.
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of number of quantum defects.
    }
    \item{x}{
	A numeric vector of the excited energy state.
    }
}
\details{
These data are the result of a NIST study involving
quantum defects in iodine atoms.  The response
variable is the number of quantum defects, and the
predictor variable is the excited energy state.
The argument to the ARCTAN function is in radians.
}
\source{
Roszman, L., NIST (19??).  
Quantum Defects for Sulfur I Atom.
}
\examples{
library(NISTnls)
data(Roszman1)
plot(y ~ x, data = Roszman1)
fm1 <- nls(y ~ b1 - b2*x - atan(b3/(x-b4))/pi, data = Roszman1,
           start = c(b1 = 0.1, b2 = -0.00001, b3 = 1000, b4 = -100),
           trace = TRUE, warnOnly = TRUE)
fm2 <- nls(y ~ b1 - b2*x - atan(b3/(x-b4))/pi, data = Roszman1,
           start = c(b1 = 0.2, b2 = -0.0000015, b3 = 1200, b4 = -150),
           trace = TRUE, warnOnly = TRUE)
}
\keyword{datasets}
