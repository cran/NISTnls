%%% $Id: Chwirut2.Rd,v 1.1 1999/05/27 16:07:58 bates Exp $
\name{Chwirut2}
\alias{Chwirut2}
\non_function{}
\title{Ultrasonic calibration data 2}
\description{
The \code{Chwirut2} data frame has nr rows and nc columns giving
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of ultrasonic response values.
    }
    \item{x}{
	A numeric vector of metal distance values.
    }
}
\details{
These data are the result of a NIST study involving
ultrasonic calibration.  The response variable is
ultrasonic response, and the predictor variable is
metal distance.
}
\source{
    Chwirut, D., NIST (197?).  
    Ultrasonic Reference Block Study. 
}
\examples{
library(NISTnls)
data(Chwirut2)
plot(y ~ x, data = Chwirut2)
fm1 <- nls(y ~ exp(-b1*x)/(b2+b3*x), data = Chwirut2, trace = TRUE,
           start = c(b1 = 0.1 , b2 = 0.01, b3 = 0.02) )
fm2 <- nls(y ~ exp(-b1*x)/(b2+b3*x), data = Chwirut2, trace = TRUE,
           start = c(b1 = 0.15 , b2 = 0.008, b3 = 0.01) )
fm3 <- nls(y ~ exp(-b1*x)/(1+p3*x), data = Chwirut2, trace = TRUE,
           start = c(b1 = 0.1, p3 = 2.), alg = "plinear" )
fm4 <- nls(y ~ exp(-b1*x)/(1+p3*x), data = Chwirut2, trace = TRUE,
           start = c(b1 = 0.15, p3 = 0.01/0.008), alg = "plinear" )
}
\keyword{datasets}
