%%% $Id: Misra1a.Rd,v 1.2 2001/01/10 17:49:12 bates Exp $
\name{Misra1a}
\alias{Misra1a}
\non_function{}
\title{Monomolecular Absorption Data}
\description{
  The \code{Misra1a} data frame has 14 rows and 2 columns.
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
data(Misra1a)
plot(y ~ x, data = Misra1a)
fm1 <- nls(y ~ b1*(1-exp(-b2*x)), data = Misra1a, trace = TRUE,
           start = c(b1 = 500, b2 = 0.0001) )
fm2 <- nls(y ~ b1*(1-exp(-b2*x)), data = Misra1a, trace = TRUE,
           start = c(b1 = 250, b2 = 0.0005) )
fm3 <- nls(y ~ 1-exp(-b2*x), data = Misra1a, trace = TRUE,
           start = c(b2 = 0.0001), algorithm = "plinear" )
fm4 <- nls(y ~ 1-exp(-b2*x), data = Misra1a, trace = TRUE,
           start = c(b2 = 0.0005), algorithm = "plinear" )
## Using a self-starting model
fm5 <- nls(y ~ SSasympOrig(x, Asym, lrc), data = Misra1a)
}
\keyword{datasets}
