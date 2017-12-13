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
    usersFollowers = c()
    for(i in 1:length(usersFollowersDeets))
    {
      currentFollower <- data.frame(user = usersFollowersDeets[[i]]$login)
      usersFollowers= append(usersFollowers,values = currentFollower, after=length(usersFollowers))
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
  gitusers = c("nikumu", "srcmaxim", "adamralph", "nomadbot", "TunedMystic", "erolaliyev", "Hasib36", "nichanank", "lennyroyroy", "rftHusn", "regisfoucault", "cyberdrk", "andreccosta", "JusethAg", "saldanac", "zhanbei", "GabrielDS", "mehedi432", "Ryanmtate", "nemobgs", "serafeimgr", "yoginth", "sfdye", "amazingandyyy", "Vermisse", "evanswanjau", "jenshinshao", "NaSabbir", "fdb", "franniez", "jryans", "serialization", "RaphaelKomander","fabpot", "andrew", "taylorotwell", "egoist", "HugoGiraudel", "ornicar", "bebraw", "nelsonic", "alexcrichton", "jonathanong", "mikermcneil", "benbalter", "jxnblk", "yegor256", "orta", "rstacruz" , "GrahamCampbell", "afc163", "kamranahmedse", "joshaber", "bkeepers", "kennethreitz", "kytrinyx", "STRML", "atmos", "weierophinney"
               , "agentzh", "steipete", "ai","mikepenz", "nvie", "hadley", "appleboy", "Rich-Harris", "drnic", "rafaelfranca", "ocramius", "mitchellh", "stof", "IgorMinar", "phodal", "jwiegley", "geerlingguy", "dcramer", "sebastianbergmann", "brunocvcunha", "ljharb", "jdalton", "sevilayha", "paulmillr",
               "tmm1","flynnn5", "skeher", "kehers", "aoifetiernan", "noonandavid", "sorchaobyrne", "conorwallace", "fionawolfe", "oboyle-mikey", "dowlind1", "connold9", "c9s", "zcbenz", "holman", "kevinsawicki", "yihui", "buckyroberts", "kbrsh", "dmalan", "mhevery", "mgechev", "kylef", "chjj", "ayende", "mcollina", "mdo", "yoshuawuyts", "muan","kentcdodds", "jskeet", "mitsuhiko", "steveklabnik", "hzoo", "caged", "dlew", "technoweenie")

  length(gitusers)
  ID = c()
  Followers = c()
  Following=  c()
  Location = c()
  NumberOfRepos = c()
  getBasicData("flynnn5")
  for(i in 1:length(gitusers)) {
    userData= getBasicData(gitusers[i])
    ID= append(ID,values = userData[2], after=length(ID))
    Followers= append(Followers,values = userData[3], after=length(Followers))
    Following= append(Following,values = userData[4], after=length(Following))
    Location= append(Location,values = userData[5], after=length(Location))
    noRepo = getNoRepo(gitusers[i])
    NumberOfRepos = append(NumberOfRepos, values = noRepo, after = length(NumberOfRepos))
  }

fd= cbind(ID,Followers,Following,Location,NumberOfRepos)
fd
write.csv(fd, "MyData.csv")
