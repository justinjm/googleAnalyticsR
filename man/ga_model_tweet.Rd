% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/models.R
\name{ga_model_tweet}
\alias{ga_model_tweet}
\title{Upload an interactive visualisation so it can be embedded in a tweet}
\usage{
ga_model_tweet(model_output, twitter, title, bucket, image = "")
}
\arguments{
\item{model_output}{A \code{ga_model_result} object created by \link{ga_model}}

\item{twitter}{Your twitter handle e.g. \code{@holomarked}}

\item{title}{Twitter preview card title text}

\item{bucket}{The GCS bucket to upload to}

\item{image}{An optional image to display before the visualition runs}
}
\description{
Inspired by \url{https://datatitian.com/how-to-turn-your-ggplot2-visualization-into-an-interactive-tweet/} this uploads your model output into Google Cloud storage, in the right format to embed in a tweet
}
\details{
This should work with all model outputs that are using \code{library(htmlwidgets)}

If using plotly, you need an account to use \code{plotly_IMAGE} to generate the preview image.

If you don't use a preview image, a generic one will be supplied instead.

You need to authenticate with `googleCloudStorageR` before running this function so it can upload the appropriate files and make them public.   

\url{https://cards-dev.twitter.com/validator} is useful to test what it will look like on Twitter.
}
\examples{

\dontrun{
  library(googleAnalyticsModelR)
  library(googleAnalyticsR)
  library(plotly)

  # create your htmlwidget output - in this case plot.ly
  output <- ga_time_normalised(81416156, interactive_plot = TRUE)
  
  # if you have a plot.ly account, you can generate a static image
  plotly_IMAGE(output$plot, out_file = "tweet.png")

  # now upload - assumes auto-authentication with googleCloudStorage
  library(googleCloudStorageR)
  ga_model_tweet(output, 
                 "@HoloMarked", 
                 "Test2 ga_model twitter upload", 
                 bucket = "mark-edmondson-public-read",
                 image = "tweet.png")
}

}
\seealso{
Other GA modelling functions: \code{\link{ga_model_edit}},
  \code{\link{ga_model_example}},
  \code{\link{ga_model_load}}, \code{\link{ga_model_make}},
  \code{\link{ga_model_save}},
  \code{\link{ga_model_write}}, \code{\link{ga_model}}
}
\concept{GA modelling functions}
