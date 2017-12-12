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


user= "kehers"
getName = function(user){
userData =GET(paste("https://api.github.com/users/", user, sep=""), gtoken)
inputJson = fromJSON(paste("https://api.github.com/users/", user, sep=""))
username = inputJson$login
return (username)
}

getID =function(user){
userData =GET(paste("https://api.github.com/users/", user, sep=""), gtoken)
inputJson = fromJSON(paste("https://api.github.com/users/", user, sep=""))
username = usersContent$login
userID = usersContent$id
return(userID)
}

getAvatar =function(user){
userData =GET(paste("https://api.github.com/users/", user, sep=""), gtoken)
inputJson = fromJSON(paste("https://api.github.com/users/", user, sep=""))
usersAvatarDetails = GET(userAvatUrl, gtoken)
usersAvatarDetails$date #come back to this
return(usersAvatarDetails$content)
}

getFollowers = function(user){
usersFOllowersDetails = GET(paste("https://api.github.com/users/", user, "/followers", sep=""), gtoken)
usersFollowersDeets =content(usersFOllowersDetails)
usersFollowers = data.frame()
for(i in 1:length(usersFollowersDeets))
{
  currentFollower <- data.frame(user = usersFollowersDeets[[i]]$login)
  usersFollowers = rbind(usersFollowers, currentFollower)
}
return(usersFollowers)
}

getFollowing = function(user){
usersFollowingDetails =GET(paste("https://api.github.com/users/", user, "/following", sep=""), gtoken)
usersFollowingDeets =content(usersFollowingDetails)
usersFollowing = data.frame()
for(i in 1:length(usersFollowingDeets))
{
  currentFollowing <- data.frame(user = usersFollowingDeets[[i]]$login)
  usersFollowing = rbind(usersFollowing, currentFollowing)
}
return(usersFollowing)
}


getRepos = function(user){
usersRepoDetails =GET(paste("https://api.github.com/users/", user, "/repos", sep=""), gtoken)
usersRepoDeets = content(usersRepoDetails)
usersRepos =data.frame()
for(i in 1:length(usersRepoDeets)){
  currentRepo <- data.frame(repo = usersRepoDeets[[i]]$name)
  usersRepos = rbind(usersRepos, currentRepo)
}
return(usersRepos)
}

getCommitDates = function (user){
userCommits =c()
usersRepoDetails =GET(paste("https://api.github.com/users/", user, "/repos", sep=""), gtoken)
usersRepoDeets = content(usersRepoDetails)
usersRepos =data.frame()
for(i in 1:length(usersRepoDeets)){
  currentRepo <- data.frame(repo = usersRepoDeets[[i]]$name)
  usersRepos = rbind(usersRepos, currentRepo)
}
for (i in 2:length(usersRepoDeets)){
  jsonRep = fromJSON(paste("https://api.github.com/repos/" ,user, "/" , usersRepos$repo[i], "/commits", sep=""))
  currentCommit = jsonRep$commit$author$date
  userCommits= append(userCommits,values = currentCommit, after=length(userCommits))
  }
return(userCommits)
}
getCommitDates("flynnn5")


#i now have the data to include in my visualization- this is name,ID,followers,following,list of Repos and number of Commits
