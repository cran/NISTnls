%%% $Id: Hahn1.Rd,v 1.1 1999/05/27 16:07:58 bates Exp $
\name{Hahn1}
\alias{Hahn1}
\non_function{}
\title{Thermal expansion data}
\description{
The \code{Hahn1} data frame has 236 rows and 2 columns of data from a
study on the thermal expansion of copper.
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of values of the coefficient of thermal expansion.
    }
    \item{x}{
	A numeric vector of temperatures (K).
    }
}
\details{
These data are the result of a NIST study involving
the thermal expansion of copper.  The response 
variable is the coefficient of thermal expansion, and
the predictor variable is temperature in degrees 
Kelvin.}
\source{
Hahn, T., NIST (197?). 
Copper Thermal Expansion Study.
}
\examples{
library(NISTnls)
data(Hahn1)
plot(y ~ x, data = Hahn1)
fm1 <- nls(y ~ (b1+b2*x+b3*x**2+b4*x**3) / (1+b5*x+b6*x**2+b7*x**3),
           data = Hahn1, trace = TRUE,
           start = c(b1 = 10, b2 = -1, b3 = 0.05,
             b4 = -0.00001, b5 = -0.05, b6 = 0.001, b7 = -0.000001))
fm2 <- nls(y ~ (b1+b2*x+b3*x**2+b4*x**3) / (1+b5*x+b6*x**2+b7*x**3),
           data = Hahn1, trace = TRUE,
           start = c(b1 = 1, b2 = -0.1, b3 = 0.005, b4 = -0.000001,
              b5 = -0.005, b6 = 0.0001, b7 = -0.0000001))
fm3 <- nls(y ~ cbind(1, x, x^2, x^3)/(1+x*(b5+x*(b6+x*b7))),
           data = Hahn1, trace = TRUE, algorithm = "plinear",
           start = c(b5 = -0.05, b6 = 0.001, b7 = -0.000001))
fm4 <- nls(y ~ cbind(1, x, x^2, x^3)/(1+x*(b5+x*(b6+x*b7))),
           data = Hahn1, trace = TRUE, algorithm = "plinear",
           start = c(b5 = -0.005, b6 = 0.0001, b7 = -0.0000001))
}
\keyword{datasets}
