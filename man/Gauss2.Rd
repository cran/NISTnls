%%% $Id: Gauss2.Rd,v 1.1 1999/05/27 16:07:58 bates Exp $
\name{Gauss2}
\alias{Gauss2}
\non_function{}
\title{Generated data}
\description{
The \code{Gauss2} data frame has 250 rows and 2 columns giving
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of generated response values.
    }
    \item{x}{
	A numeric vector of generated input values.
    }
}
\details{
    The data are two slightly-blended Gaussians on a 
    decaying exponential baseline plus normally 
    distributed zero-mean noise with variance = 6.25. 
}
\source{
    Rust, B., NIST (1996)
}
\examples{
library(NISTnls)
data(Gauss2)
plot(y ~ x, data = Gauss2)
fm1 <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss2, trace = TRUE,
           start = c(b1 = 96, b2 = 0.009, b3 = 103, b4 = 106, b5 = 18,
                     b6 = 72, b7 = 151, b8 = 18))
fm2 <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss2, trace = TRUE,
           start = c(b1 = 98, b2 = 0.0105, b3 = 103, b4 = 105, b5 = 20,
                     b6 = 73, b7 = 150, b8 = 20))
fm3 <- nls(y ~ cbind(exp(-b2*x), exp(-(x-b4)**2/b5**2), exp(-(x-b7)**2/b8**2)),
           data = Gauss2, trace = TRUE,
           start = c(b2 = 0.009, b4 = 106, b5 = 18, b7 = 151, b8 = 18),
           algorithm = "plinear")
fm4 <- nls(y ~ cbind(exp(-b2*x), exp(-(x-b4)**2/b5**2), exp(-(x-b7)**2/b8**2)),
           data = Gauss2, trace = TRUE,
           start = c(b2 = 0.0105, b4 = 105, b5 = 20, b7 = 150, b8 = 20),
           algorithm = "plinear")
}
\keyword{datasets}
