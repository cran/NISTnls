%%% $Id: Misra1c.Rd,v 1.2 2001/01/10 17:49:12 bates Exp $
\name{Misra1c}
\alias{Misra1c}
\non_function{}
\title{Monomolecular Absorption data}
\description{
The \code{Misra1c} data frame has 14 rows and 2 columns.
This is the same data as \code{Misra1a} but a different model is fit.
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of volume values.
    }
    \item{x}{
	A numeric vector of pressure values.
    }
}
\details{
These data are the result of a NIST study regarding
dental research in monomolecular adsorption.  The
response variable is volume, and the predictor
variable is pressure.
}
\source{
Misra, D., NIST (1978).  
Dental Research Monomolecular Adsorption Study.
}
\examples{
data(Misra1c)
plot(y ~ x, data = Misra1c)
fm1 <- nls(y ~ b1*(1-(1+2*b2*x)**(-.5)), data = Misra1c, trace = TRUE,
           start = c(b1 = 500, b2 = 0.0001) )
fm2 <- nls(y ~ b1*(1-(1+2*b2*x)**(-.5)), data = Misra1c, trace = TRUE,
           start = c(b1 = 600, b2 = 0.0002) )
fm3 <- nls(y ~ 1-(1+2*b2*x)**(-.5), data = Misra1c, trace = TRUE,
           start = c(b2 = 0.0001), algorithm = "plinear" )
fm4 <- nls(y ~ 1-(1+2*b2*x)**(-.5), data = Misra1c, trace = TRUE,
           start = c(b2 = 0.0002), algorithm = "plinear" )
}
\keyword{datasets}
