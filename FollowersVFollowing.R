library(plotly)
trace1 <- list(
  x = c("50", "306", "143", "30", "92", "22", "38", "17", "41", "80", "39", "47", "77", "6", "10", "38", "59", "703", "16", "1891", "65", "53", "113", "100", "167", "3", "29", "45", "27", "29", "14", "7", "87", "26", "11", "93", "60", "126", "8", "49", "107", "58", "3", "7", "40", "54", "151", "38", "26", "17", "6", "34", "53", "225", "38", "26", "7", "14", "259", "36", "18", "7", "16", "84", "82", "11", "10", "85", "258", "44", "15", "102", "215", "4", "43", "42", "10", "17", "8", "761", "83", "42", "1778", "415", "43", "338", "66", "72", "144", "1", "50", "6", "7", "77", "59", "6", "1", "8", "28", "188"), 
  y = c("45", "238", "134", "15", "369", "9", "52", "23", "95", "85", "53", "67", "97", "6", "25", "87", "46", "133", "5", "545", "464", "103", "418", "139", "1649", "1", "29", "39", "33", "150", "4", "8", "58", "18", "6", "62", "80", "6", "14", "144", "44", "808", "29", "7", "13", "106", "22", "38", "48", "27", "17", "7", "190", "12", "154", "266", "21", "29", "1689", "119", "13", "21", "32", "35", "200", "12", "10", "119", "4071", "118", "117", "96", "1273", "16", "42", "183", "23", "13", "20", "15939", "63", "48", "326", "645", "67", "839", "50", "356", "53", "1", "272", "1", "34", "132", "316", "28", "3", "8", "19", "470"), 
  marker = list(
    size = c("12", "15", "80", "20", "80", "18", "1", "13", "2", "1", "21", "24", "10", "9", "99", "13", "25", "30", "17", "16", "7", "100", "51", "100", "14", "13", "20", "15", "95", "4", "100", "10", "3", "27", "100", "1", "100", "43", "100", "100", "100", "100", "56", "100", "100", "100", "74", "100", "100", "20", "100", "38", "38", "100", "100", "100", "100", "100", "100", "63", "42", "55", "54", "100", "100", "100", "100", "100", "100", "100", "89", "100", "100", "100", "100", "100", "100", "51", "64", "100", "11", "25", "54", "100", "4", "5", "39", "5", "2", "4", "7", "2", "6", "6", "3", "100", "28", "52", "100", "83"), 
    sizemode = "area", 
    sizeref = 0.12375, 
    sizesrc = "flynnn5:9:dd0626"
  ), 
  mode = "markers", 
  name = "Following", 
  text = c("matthewford", "Sutto", "caius", "georgepalmer", "lgs", "mocoso", "patrickdet", "ioptics", "mikeymicrophone", "TomK32", "neogeek", "nogeek", "thommay", "DewayneM", "eddiegreysherman", "pvdb", "lmjabreu", "3rd-Eden", "simplescott", "rkh", "jits", "joshnesbitt", "abecciu", "qichunren", "stonegao", "robert-xx", "baoist", "lloydpick", "BBB", "haifeng", "jonspalding", "er-minio", "thattommyhall", "maletor", "thoswarner", "bscott", "barisbalic", "stephenlloyd", "vpacher", "jaymzcd", "appleton", "RaymondCrandall", "futurespective", "jrstanley", "mpatric", "richmarr", "Rumyra", "MrQwest", "codegoblin", "lhaig", "undeadrevo", "redroot", "andrewseddon", "eduardordm", "jairodiaz", "druwynings", "icecreamboyy", "angelsk", "ryanlecompte", "jcalonso", "seo01", "jakeg", "layflags", "Zizzamia", "tuzz", "hackjoy", "nodesolomon", "hems", "JSansalone", "saada", "LouisBeardsley", "tombh", "Sannis", "chekiesco", "dwbutler", "aabril", "congmo", "gridsquare", "yayohei", "csjaba", "skattyadz", "domudall", "mcollina", "rjrodger", "electronicmax", "revathskumar", "s10wen", "baldrailers", "ejholmes", "scarlet88", "musha68k", "aaycock", "mykhas", "gomayonqui", "lisovskyvlad", "gadro", "jiangjingpku", "evinsou", "thenickcox", "evandrix"), 
  textsrc = "flynnn5:9:0360db", 
  type = "scatter", 
  uid = "4fd9c2", 
  xsrc = "flynnn5:9:ebe196", 
  ysrc = "flynnn5:9:b3a513"
)
data <- list(trace1)
layout <- list(
  autosize = TRUE, 
  hovermode = "closest", 
  title = "Andrew's UK Followers- Their Followers Vs Following", 
  xaxis = list(
    autorange = TRUE, 
    range = c(-211.705160048, 2044.98269982), 
    title = "Followers", 
    type = "linear"
  ), 
  yaxis = list(
    autorange = TRUE, 
    range = c(-4130.70129328, 20073.7012933), 
    title = "Following", 
    type = "linear"
  )
)
p <- plot_ly()
p <- add_trace(p, x=trace1$x, y=trace1$y, marker=trace1$marker, mode=trace1$mode, name=trace1$name, text=trace1$text, textsrc=trace1$textsrc, type=trace1$type, uid=trace1$uid, xsrc=trace1$xsrc, ysrc=trace1$ysrc)
p <- layout(p, autosize=layout$autosize, hovermode=layout$hovermode, title=layout$title, xaxis=layout$xaxis, yaxis=layout$yaxis)