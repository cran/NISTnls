%%% $Id: Gauss3.Rd,v 1.1 1999/10/13 00:50:08 saikat Exp $
\name{Gauss3}
\alias{Gauss3}
\non_function{}
\title{Generated data}
\description{
The \code{Gauss3} data frame has 250 rows and 2 columns giving generated
data of Gaussian peaks with a decaying exponential background.
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of generated responses.
    }
    \item{x}{
	A numeric vector of generated inputs.
    }
}
\details{
The data are two strongly-blended Gaussians on a 
decaying exponential baseline plus normally 
distributed zero-mean noise with variance = 6.25.
}
\source{
Rust, B., NIST (1996).
}
\examples{
library(NISTnls)
data(Gauss3)
plot(y ~ x, data = Gauss3)
fm1 <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss3, trace = TRUE,
           start = c(b1 = 94.9, b2 = 0.009, b3 = 90.1, b4 = 113, b5 = 20,
                     b6 = 73.8, b7 = 140, b8 = 20))
fm2 <- nls(y ~ b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
               + b6*exp( -(x-b7)**2 / b8**2 ), data = Gauss3, trace = TRUE,
           start = c(b1 = 96, b2 = 0.0096, b3 = 80, b4 = 110, b5 = 25,
                     b6 = 74, b7 = 139, b8 = 25)) 
fm3 <- nls(y ~ cbind(exp(-b2*x), exp(-(x-b4)**2/b5**2), exp(-(x-b7)**2/b8**2)),
           data = Gauss3, trace = TRUE,
           start = c(b2 = 0.009, b4 = 113, b5 = 20, b7 = 140, b8 = 20),
           algorithm = "plinear")
fm4 <- nls(y ~ cbind(exp(-b2*x), exp(-(x-b4)**2/b5**2), exp(-(x-b7)**2/b8**2)),
           data = Gauss3, trace = TRUE,
           start = c(b2 = 0.0096, b4 = 110, b5 = 25, b7 = 139, b8 = 25),
           algorithm = "plinear")
}
\keyword{datasets}
