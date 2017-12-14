library(plotly)
trace1 <- list(
  z = c("2555", "1153", "134", "100", "114", "75", "15", "1", "30", "16", "100", "100", "100", "2", "7", "100", "6", "6"), 
  autocolorscale = FALSE, 
  colorscale = list(c(0, "rgb(222, 183, 175)"),list(0.35, "rgb(207, 131, 113)"),list(0.5, "rgb(192, 88, 64)"),list(0.6, "rgb(182, 59, 37)"),list(0.7, "rgb(150, 19, 27)"),list(1, "rgb(144, 19, 28)")), 
  locationmode = "country names", 
  locations = c("UK", "USA", "Italy", "Ireland", "China", "Germany", "Australia", "Austria", "The Netherlands", "Switzerland", "Brazil", "Russia", "Mexico", "Thailand", "Canada", "India", "Ukraine", "Colombia"), 
  locationssrc = "flynnn5:6:b5f8be", 
  name = "Repos", 
  type = "choropleth", 
  uid = "6359cb", 
  zauto = TRUE, 
  zmax = 2555, 
  zmin = 1, 
  zsrc = "flynnn5:6:5a860d"
)
data <- list(trace1)
layout <- list(
  autosize = TRUE, 
  geo = list(
    projection = list(
      rotation = list(lon = -13.4264819529), 
      scale = 0.744838743255
    ), 
    showcountries = TRUE, 
    showlakes = FALSE, 
    showland = FALSE, 
    showocean = TRUE
  ), 
  hovermode = "closest", 
  title = "Repos per Country of Andrew's Followers"
)
p <- plot_ly()
p <- add_trace(p, z=trace1$z, autocolorscale=trace1$autocolorscale, colorscale=trace1$colorscale, locationmode=trace1$locationmode, locations=trace1$locations, locationssrc=trace1$locationssrc, name=trace1$name, type=trace1$type, uid=trace1$uid, zauto=trace1$zauto, zmax=trace1$zmax, zmin=trace1$zmin, zsrc=trace1$zsrc)
p <- layout(p, autosize=layout$autosize, geo=layout$geo, hovermode=layout$hovermode, title=layout$title)