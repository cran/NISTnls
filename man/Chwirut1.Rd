%%% $Id: Chwirut1.Rd,v 1.1 1999/10/13 00:50:08 saikat Exp $
\name{Chwirut1}
\alias{Chwirut1}
\non_function{}
\title{Ultrasonic calibration study 1}
\description{
The \code{Chwirut1} data frame has 214 rows and 2 columns giving
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of ultrasonic response values
    }
    \item{x}{
	A numeric vector or metal distance values
    }
}
\details{
These data are the result of a NIST study involving
ultrasonic calibration.  The response variable is
ultrasonic response, and the predictor variable is
metal distance.
}
\source{
Chwirut, D., NIST (197?).   Ultrasonic Reference Block Study. 
}
\examples{
library(NISTnls)
data(Chwirut1)
plot(y ~ x, data = Chwirut1)
fm1 <- nls(y ~ exp(-b1*x)/(b2+b3*x), data = Chwirut1, trace = TRUE,
           start = c(b1 = 0.1, b2 = 0.01, b3 = 0.02))
fm2 <- nls(y ~ exp(-b1*x)/(b2+b3*x), data = Chwirut1, trace = TRUE,
           start = c(b1 = 0.15, b2 = 0.008, b3 = 0.010))
fm3 <- nls(y ~ exp(-b1*x)/(1+p3*x), data = Chwirut1, trace = TRUE,
           start = c(b1 = 0.1, p3 = 0.02/0.01), algorithm = "plinear")
fm4 <- nls(y ~ exp(-b1*x)/(1+p3*x), data = Chwirut1, trace = TRUE,
           start = c(b1 = 0.15, p3 = 0.01/0.008), algorithm = "plinear")
}
\keyword{datasets}
