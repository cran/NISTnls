%%% $Id: Thurber.Rd,v 1.2 1999/06/01 21:38:49 bates Exp $
\name{Thurber}
\alias{Thurber}
\non_function{}
\title{Electron mobility data}
\description{
The \code{Thurber} data frame has 37 rows and 2 columns.
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of electron mobility values.
    }
    \item{x}{
	A numeric vector of logs of electron density values.
    }
}
\details{
These data are the result of a NIST study involving
semiconductor electron mobility.  The response 
variable is a measure of electron mobility, and the 
predictor variable is the natural log of the density.
}
\source{
Thurber, R., NIST (197?).  
Semiconductor electron mobility modeling.
}
\examples{
library(NISTnls)
data(Thurber)
plot(y ~ x, data = Thurber)
fm1 <- nls(y ~ (b1+x*(b2+x*(b3+b4*x))) / (1+x*(b5+x*(b6+x*b7))),
           data = Thurber, trace = TRUE, warnOnly = TRUE,
           start = c(b1 = 1000, b2 = 1000, b3 = 400, b4 = 40,
                     b5 = 0.7, b6 = 0.3, b7 = 0.03))
fm2 <- nls(y ~ (b1+x*(b2+x*(b3+b4*x))) / (1+x*(b5+x*(b6+x*b7))),
           data = Thurber, trace = TRUE, warnOnly = TRUE,
           start = c(b1 = 1300, b2 = 1500, b3 = 500, b4 = 75,
                     b5 = 1, b6 = 0.4, b7 = 0.05))
fm3 <- nls(y ~ outer(x, 0:3, "^")/(1+x*(b5+x*(b6+x*b7))),
           data = Thurber, trace = TRUE, warnOnly = TRUE,
           start = c(b5 = 0.7, b6 = 0.3, b7 = 0.03), alg = "plinear")
fm4 <- nls(y ~ outer(x, 0:3, "^")/(1+x*(b5+x*(b6+x*b7))),
           data = Thurber, trace = TRUE, warnOnly = TRUE,
           start = c(b5 = 1, b6 = 0.4, b7 = 0.05), alg = "plinear")
fm4
}
\keyword{datasets}

