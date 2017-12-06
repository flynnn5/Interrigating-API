#0 users
#Client ID
#057318aa331d2de47a26
#Client Secret

install.packages("jsonlite")
library(jsonlite)
install.packages("httpuv")
library(httpuv)
install.packages("httr")
library(httr)
oauth_endpoints("github")
myapp <- oauth_app(appname = "Assignment-5_flynnn5", key = "057318aa331d2de47a26", secret = "535f234f11eb31e16220009cbfeffb1cf81ecba1")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/flynnn5/repos", gtoken)
stop_for_status(req)
json1 = content(req)
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))
gitDF[gitDF$full_name == "flynnn5/datasharing", "created_at"]

jsondata = fromJSON("https://api.github.com/users/flynnn5/followers")
class(jsondata)
names(jsondata)
myFollowers = c(jsondata$login)
myFollowers

followersINT = length(myFollowers)
followersINT
followersUrls =1:8
for (i in 1:followersINT) {
  url = "https://api.github.com/users/"
  followersUrls[i] = paste(url,myFollowers[i], sep="")
  i=i+1
}
followersUrls

