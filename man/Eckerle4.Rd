%%% $Id: Eckerle4.Rd,v 1.3 2001/01/10 17:49:12 bates Exp $
\name{Eckerle4}
\alias{Eckerle4}
\non_function{}
\title{Circular interference data}
\description{
The \code{Eckerle4} data frame has 35 rows and 2 columns giving
transmittance as a function of wavelength.
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of transmittance values.
    }
    \item{x}{
	A numeric vector of wavelengths.
    }
}
\details{
These data are the result of a NIST study involving
circular interference transmittance.  The response
variable is transmittance, and the predictor variable
is wavelength.
}
\source{
Eckerle, K., NIST (197?).  
Circular Interference Transmittance Study.
}
\examples{
data(Eckerle4)
plot(y ~ x, data = Eckerle4)
\dontrun{
## should fail - ridiculous starting value for b3
fm1 <- nls(y ~ (b1/b2) * exp(-0.5*((x-b3)/b2)**2), data = Eckerle4, trace = TRUE,
           start = c(b1 = 1, b2 = 10, b3 = 500))
}
fm2 <- nls(y ~ (b1/b2) * exp(-0.5*((x-b3)/b2)**2), data = Eckerle4, trace = TRUE,
           start = c(b1 = 1.5, b2 = 5, b3 = 450))
\dontrun{
## should fail - ridiculous starting value for b3
fm3 <- nls(y ~ (1/b2) * exp(-0.5*((x-b3)/b2)**2), data = Eckerle4, trace = TRUE,
           start = c(b2 = 10, b3 = 500), algorithm = "plinear")
}
fm4 <- nls(y ~ (1/b2) * exp(-0.5*((x-b3)/b2)**2), data = Eckerle4, trace = TRUE,
           start = c(b2 = 5, b3 = 450), algorithm = "plinear")
}
\keyword{datasets}
