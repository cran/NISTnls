%%% $Id: Misra1d.Rd,v 1.2 2001/01/10 17:49:12 bates Exp $
\name{Misra1d}
\alias{Misra1d}
\non_function{}
\title{Monomolecular Absorption data}
\description{
  The \code{Misra1d} data frame has 14 rows and 2 columns.
  This is the same data as \code{Misra1a} but a different model is fit.
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{y}{
      A numeric vector of volume values.
    }
    \item{x}{
      A numeric vector of pressure values.
    }
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
data(Misra1d)
plot(y ~ x, data = Misra1d)
fm1 <- nls(y ~ b1*b2*x*((1+b2*x)**(-1)), data = Misra1d, trace = TRUE,
           start = c(b1 = 500, b2 = 0.0001) )
fm2 <- nls(y ~ b1*b2*x*((1+b2*x)**(-1)), data = Misra1d, trace = TRUE,
           start = c(b1 = 450, b2 = 0.0003) )
fm3 <- nls(y ~ b2*x*((1+b2*x)**(-1)), data = Misra1d, trace = TRUE,
           start = c(b2 = 0.0001), algorithm = "plinear" )
fm4 <- nls(y ~ b2*x*((1+b2*x)**(-1)), data = Misra1d, trace = TRUE,
           start = c(b2 = 0.0005), algorithm = "plinear" )
}
\keyword{datasets}
