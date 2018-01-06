% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pool.scalar.r
\name{pool.scalar}
\alias{pool.scalar}
\title{Multiple imputation pooling: univariate version}
\usage{
pool.scalar(Q, U, n = Inf, k = 1)
}
\arguments{
\item{Q}{A vector of univariate estimates of \code{m} repeated complete data
analyses.}

\item{U}{A vector containing the corresponding \code{m} variances of the univariate
estimates.}

\item{n}{A number providing the sample size. If nothing is specified, an infinite sample \code{n = Inf} is assumed.}

\item{k}{A number indicating the number of parameters to be estimated. By default, \code{k = 1} is assumed.}
}
\value{
Returns a list with components. Component \code{m} is the 
number of imputations. Component \code{qhat} contains the \code{m} 
univariate estimates of repeated complete data analyses.
Component \code{u} contains the corresponding \code{m} variances of the univariate estimates.
Component \code{qbar} is the pooled univariate estimate, formula (3.1.2) Rubin
(1987). Component \code{ubar} is the mean of the variances 
(i.e. the pooled within-imputation variance), formula (3.1.3) Rubin (1987).
Component \code{b} is the between-imputation variance, formula (3.1.4) Rubin (1987).
Component \code{t} is the total variance of the pooled estimated, formula (3.1.5) Rubin
(1987).
Component \code{r} is the relative increase in variance due to nonresponse, formula
(3.1.7) Rubin (1987).
Component \code{df} is the degrees of freedom for t reference distribution, formula
(3.1.6) Rubin (1987) or method of Barnard-Rubin (1999) (if \code{method = "smallsample"}).
Component \code{fmi} is the fraction missing information due to nonresponse, formula
(3.1.10) Rubin (1987).
}
\description{
Pools univariate estimates of m repeated complete data analysis
}
\details{
The function averages the univariate estimates of the complete data model,
computes the total variance over the repeated analyses, and computes the
relative increase in variance due to nonresponse and the fraction of missing
information.
}
\examples{


imp <- mice(nhanes)
m <- imp$m
Q <- rep(NA, m)
U <- rep(NA, m)
for (i in 1:m) {
   Q[i] <- mean(complete(imp, i)$bmi)
   U[i] <- var(complete(imp, i)$bmi) / nrow(nhanes)  # (standard error of estimate)^2
}
pool.scalar(Q, U, n = nrow(nhanes), k = 1)  # Barnard-Rubin 1999

}
\references{
Rubin, D.B. (1987). Multiple Imputation for Nonresponse in
Surveys.  New York: John Wiley and Sons.
}
\seealso{
\code{\link{pool}}
}
\author{
Karin Groothuis-Oudshoorn and Stef van Buuren, 2009
}
\keyword{htest}
