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
jsondata
class(jsondata)
names(jsondata)
myFollowers = c(jsondata$login)
myFollowers
#getting information on my followers, and their number of followers
followersINT = length(myFollowers)
followersINT
followersFollowersUrl = 1:followersINT
repoUrls = 1:followersINT
followersUrls =1:followersINT
for (i in 1:followersINT) {
  url = "https://api.github.com/users/"
  followersUrls[i] = paste(url,myFollowers[i], sep="")
  repoUrls[i]=paste(followersUrls[i], "/repos", sep="")
  
}
followersUrls
repoUrls


skUrl = followersUrls[1]
skUrl
skJson = fromJSON(skUrl)
skJson$repos #gets urls for repos
skRepo = fromJSON(paste0(skUrl, "/repos", sep=""))
SkRepos = length(skRepo$commits_url)
SkRepos
skRepo$name
skReposNames= 1:5
for (i in 1:5){
  skReposNames[i] = paste(skUrl, "/repos/", skRepo$name[i], sep="")
}
skReposNames
repp =fromJSON("https://api.github.com/repos/skeher/LCA/commits")
repp$commit$author$date

