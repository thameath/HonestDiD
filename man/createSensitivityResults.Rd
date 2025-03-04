\name{createSensitivityResults}
\alias{createSensitivityResults}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Constructs robust confidence intervals for Delta = Delta^{SD}(M), Delta^{SDB}(M) and Delta^{SDM}(M) for vector of possible M values.
}
\description{
  Constructs robust confidence intervals for a choice Delta = Delta^{SD}(M), Delta^{SDB}(M) and Delta^{SDM}(M) for vector of possible M values. By default, the function constructs robust confidence intervals for Delta^{SD}(M).
}
\usage{
createSensitivityResults(betahat, sigma, numPrePeriods, numPostPeriods,
                  method = NULL, Mvec = NULL,
                  l_vec = .basisVector(index = 1, size = numPostPeriods),
                  monotonicityDirection = NULL,
                  biasDirection = NULL, alpha = 0.05, parallel = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{betahat}{
  Vector of estimated event study coefficients.
  }
  \item{sigma}{
  Covariance matrix of event study coefficients.
  }
  \item{numPrePeriods}{
  Number of pre-periods.
  }
  \item{numPostPeriods}{
  Number of post-periods.
  }
  \item{method}{
  String that specifies the choice of method for constructing robust confidence intervals. This must be one of "FLCI", "Conditional", "C-F" (conditional FLCI hybrid), or "C-LF" (conditional least-favorable hybrid). Default equals NULL and the function automatically sets method based on the recommendations in Rambachan & Roth (2021) depending on the choice of Delta. If Delta = DeltaSD, default selects the FLCI. If Delta = DeltaSDB or DeltaSDM, default delects the conditional FLCI hybrid.
  }
  \item{Mvec}{
  Vector of M values for which the user wishes to construct robust confidence intervals. If NULL, the function constructs a grid of length 10 that starts at M = 0 and ends at M equal to the upper bound constructed from the pre-periods using the function DeltaSD_upperBound_Mpre if number of pre-periods > 1 or the standard deviation of the first pre-period coefficient if number of pre-periods = 1. Default equals null.
  }
  \item{l_vec}{
  Vector of length numPostPeriods that describes the scalar parameter of interest, theta = l_vec'tau. Default equals to first basis vector, (1, 0, ..., 0)
  }
  \item{biasDirection}{
  This must be specified if the user wishes to add an additional bias restriction to Delta^{SD}(M). If "positive", bias is restricted to be positive, delta >= 0. If "negative", bias is restricted to be negative, delta <= 0. Default equals NULL.
  }
  \item{monotonicityDirection}{
  This must be specified if the user wishes to add an additional monotonicity restriction to Delta^{SD}(M). If "increasing", underlying trend specified to be increasing, delta_t >= delta_{t-1}. If "decreasing", underlying trend specified to be decreasing delta_t <= delta_{t-1}. Default equals NULL
  }
  \item{alpha}{
  Desired size of the robust confidence sets. Default equals 0.05 (corresponding to 95\% confidence interval)
  }
  \item{parallel}{
  Logical to indicate whether the user would like to construct the robust confidence intervals in parallel. This uses the Foreach package and doParallel package. Default equals FALSE.
  }
}
\value{
Returns a dataframe with columns
  \item{lb}{
  Lower bound of robust confidence sets.
  }
  \item{ub}{
  Upper bound of robust confidence sets.
  }
  \item{method}{
  Method for constructing robust confidence sets
  }
  \item{Delta}{
  The set Delta that was specified.
  }
  \item{M}{
  Values of M associated with each robust confidence set.
  }
}
\references{
Rambachan, Ashesh and Jonathan Roth. "An Honest Approach to Parallel Trends." 2021.
}
\author{
Ashesh Rambachan
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
