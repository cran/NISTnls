%%% $Id: MGH09.Rd,v 1.3 2001/01/10 17:49:12 bates Exp $
\name{MGH09}
\alias{MGH09}
\non_function{}
\title{More, Gabrow and Hillstrom example 9}
\description{
The \code{MGH09} data frame has 11 rows and 2 columns giving
}
\format{
This data frame contains the following columns:
}
\arguments{
    \item{y}{
	A numeric vector of response values.
    }
    \item{x}{
	A numeric vector of input values.
    }
}
\details{
This problem was found to be difficult for some very 
good algorithms.  There is a local minimum at (+inf,
-14.07..., -inf, -inf) with final sum of squares 
0.00102734....

See More, J. J., Garbow, B. S., and Hillstrom, K. E. 
(1981).  Testing unconstrained optimization software.
ACM Transactions on Mathematical Software. 7(1): 
pp. 17-41.
}
\source{
Kowalik, J.S., and M. R. Osborne, (1978).  
Methods for Unconstrained Optimization Problems.  
New York, NY:  Elsevier North-Holland.
}
\examples{
data(MGH09)
plot(y ~ x, data = MGH09)
\dontrun{
## starting values for this attempt are ridiculous
fm1 <- nls(y ~ b1*(x**2+x*b2) / (x**2+x*b3+b4),
           data = MGH09, trace = TRUE,
           start = c(b1 = 25, b2 = 39, b3 = 41.5, b4 = 39))
}
fm2 <- nls(y ~ b1*(x**2+x*b2) / (x**2+x*b3+b4),
           data = MGH09, trace = TRUE,
           start = c(b1 = 0.25, b2 = 0.39, b3 = 0.415, b4 = 0.39))
fm3 <- nls(y ~ cbind(x, x**2) / (x**2+x*b3+b4),
           data = MGH09, trace = TRUE, algorithm = "plinear",
           start = c(b3 = 41.5, b4 = 39))
fm4 <- nls(y ~ cbind(x, x**2) / (x**2+x*b3+b4),
           data = MGH09, trace = TRUE, algorithm = "plinear",
           start = c(b3 = 0.415, b4 = 0.39))
}
\keyword{datasets}
