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
  req <- GET("https://api.github.com/users/flynnn5", gtoken)
  stop_for_status(req)
  json1 = content(req)
  gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))
  #gitDF[gitDF$full_name == "flynnn5/datasharing", "created_at"]
  
  
  getBasicData = function(user){
    userData =GET(paste("https://api.github.com/users/", user, sep=""), gtoken)
    userContent = content(userData)
    username = userContent$login
    data = c()
    data[1] = username
    id= userContent$id
    data[2]= id
    followers = userContent$followers
    data[3]=followers
    following = userContent$following
    data[4]=following
    location = userContent$location
    if (!is.null(location)){
      data[5] = location
    }
    else {
      data[5] = "n/a"
    }
    return (data)
  }
  getFollowers = function(user){
    usersFOllowersDetails = GET(paste("https://api.github.com/users/", user, "/followers?per_page=100", sep=""), gtoken)
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
    usersFollowingDetails =GET(paste("https://api.github.com/users/", user, "/following?per_page=100", sep=""), gtoken)
    usersFollowingDeets =content(usersFollowingDetails)
    usersFollowing = data.frame()
    length(usersFollowing)
    for(i in 1:length(usersFollowingDeets))
    {
      currentFollowing <- data.frame(user = usersFollowingDeets[[i]]$login)
      usersFollowing = rbind(usersFollowing, currentFollowing)
    }
    return(usersFollowing)
  }
  
  getRepos = function(user){
    usersRepoDetails =GET(paste("https://api.github.com/users/", user, "/repos?per_page=1000", sep=""), gtoken)
    if (!is.null(usersRepoDetails)){
    usersRepoDeets = content(usersRepoDetails)
        usersRepos =c()
    for(i in 1:length(usersRepoDeets)){
      currentRepo <- data.frame(repo = usersRepoDeets[[i]]$name)
      usersRepos = append(usersRepos, values = currentRepo, after = length(usersRepos))
    }
    return(usersRepos)
    }
    else {
      return ("N/A")
    }
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
      jsonRep = fromJSON(paste("https://api.github.com/repos/" ,user, "/" , usersRepos$repo[i], "/commits?per_page=100", sep=""))
      currentCommit = jsonRep$commit$author$date
      userCommits= append(userCommits,values = currentCommit, after=length(userCommits))
    }
    return(userCommits)
  }
  
  getRepoStartDate = function(user) {
    usersRepoDetails =GET(paste("https://api.github.com/users/", user, "/repos?per_page=100", sep=""), gtoken)
    usersRepoDeets = content(usersRepoDetails)
    usersReposDate =data.frame()
    for(i in 1:length(usersRepoDeets)){
      currentRepo <- data.frame(repo = usersRepoDeets[[i]]$created_at)
      usersReposDate = rbind(usersReposDate, currentRepo)
    }
    return(usersReposDate)
  }
  
  getBasicData("andrew")
  getNoRepo = function(user){
    repos=getRepos(user) 
    noRepos= length(repos)
    return(noRepos)
  }
  
  andrewsFollowers = getFollowers("andrew")
  andrewsFollowers$user
  length(andrewsFollowers$user)
  ID = c()
  Followers = c()
  Following=  c()
  Location = c()
  NumberOfRepos = c()
  for(i in 1:length(andrewsFollowers$user)) {
    userData= getBasicData(andrewsFollowers$user[i])
    ID= append(ID,values = userData[2], after=length(ID))
    Followers= append(Followers,values = userData[3], after=length(Followers))
    Following= append(Following,values = userData[4], after=length(Following))
    Location= append(Location,values = userData[5], after=length(Location))
    noRepo = getNoRepo(gitusers[i])
    NumberOfRepos = append(NumberOfRepos, values = noRepo, after = length(NumberOfRepos))
  }
  folName = c()

fd= cbind(andrewsFollowers,ID,Followers,Following,Location,NumberOfRepos)
fd
write.csv(fd, "MyData.csv")


dateUsers = c("flynnn5", "fionawolfe", "aoifetiernan", "skeher", "sorchaobyrne", "conorwallace")


getFollowers("andrew")[1]
