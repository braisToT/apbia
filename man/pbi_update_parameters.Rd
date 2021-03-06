% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pbi_update_parameters.R
\name{pbi_update_parameters}
\alias{pbi_update_parameters}
\title{Update parameters in a given workspace}
\usage{
pbi_update_parameters(wsId, dsId, wsParam, newValue, key)
}
\arguments{
\item{wsId}{Workspace's target Id}

\item{dsId}{Dataset's target ID}

\item{wsParam}{Name of the param what you want to update}

\item{newValue}{New value for the param what you want to update}

\item{key}{PowerBI application's Azure token}
}
\value{
HTTP code to know the good/bad state of the POST request
}
\description{
Update parameters in a given workspace
}
