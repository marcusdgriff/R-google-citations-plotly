## Griffiths M (2021) Citation plot from Google Scholar profile using R and plotly
library("scholar")
library("plotly")
library("tidyverse")

#find google scholar id part of profile URL
id <- "X--dqYYAAAAJ&hl=en&oi=ao"

l <- get_profile(id)

l$name
l$affiliation
l$h_index
l$i10_index

ct <- get_citation_history(id)

ggplot(ct, aes(year, cites)) + geom_bar (position = position_dodge(), stat="identity")

p <- ggplot(data=ct, aes(x=year, y=cites)) +
  geom_bar(stat="identity") +
  theme_bw() +
  theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
  )  +
  xlab(bquote("Year")) + 
  ylab(bquote("Citations"))

p <- ggplotly(p)

p

#replace USERNAME and APIKEY with your plotly details
Sys.setenv("plotly_username"="USERNAME") 
Sys.setenv("plotly_api_key"="APIKEY")

api_create(p, filename = "googlecitations")
