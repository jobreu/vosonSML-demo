# if needed: install libraries
# install.packages("dplyr")
# install.packages("readr")
# install.packages("vosonSML")

# Load libraries ####
library(dplyr)
library(readr)
library(vosonSML)

# Authentication ####
auth_yt <- Authenticate("youtube", 
                        apiKey = "INSERT_API_KEY") # paste YouTube Data API Key here

# Data collection ####
# specify list of video URLs
video_urls <- c("https://www.youtube.com/watch?v=5A-ggbcnwcg",
                "https://www.youtube.com/watch?v=a6ZaJ38cy7U")

# collect comments from specified videos
comments_yt <- auth_yt |> 
  Collect(videoIDs = video_urls,
          maxComments = 2000) # max. 2000 comments per video (+ up to 20 replies per comment)

# Check data ####
names(comments_yt)

glimpse(comments_yt)

# Data export ####
# export comments to CSV file
write_csv(comments_yt, "youtube_comments.csv")