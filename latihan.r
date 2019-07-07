install.packages("twitteR")
library(twitteR)

install.packages("ROAuth")
library(ROAuth)

install.packages("RCurl")
library(RCurl)

download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
setup_twitter_oauth('4piAyPhQJsPgdPhC65HUHhLZS','20414hDoZY0kVLkNh2U2WHAVjBSrtsgcgS0f61Jq1FwwQWdHXj','178242770-fMlgGaZC6oqBPz4Xj21audt8gMAi8OOh7v0TxLLG','dkdRn7uinBWlym1mXCUbZlcuMcmIuDxYeR5ifKwEQGKvw')




#mengambil data dr twitter
search.string <- "#borodubur"
no.of.twwets <- 60

borobudur.Tweets <- searchTwitter(search.string, n = no.of.tweets,lang="id")
df_id <- do.call("rbind", lapply(borobudur.Tweets, as.data.frame))
View(df_id)

#versi simple
bd <- searchTwitter('#borobudur', n=60,lang = "id")
df_id <- do.call("rbind", lapply(bd, as.data.frame))
view(df_id)

#alternatif 1: menggunakan kata pencarian
#dengan parameter kata pencarian pemilu, banyaknya tweet 100
pemilu <- searchTwitter('pemilu', n=100, locale = TRUE)
df_pemilu <- do.call("rbind", lapply(pemilu, as.data.frame))
View(df_pemilu)
write.csv(df_pemilu, file ='C:/Users/RAFII/Documents/UAS_BIGDATA/UAS_BIGDATA/pemilu.csv', row.names = F)


#dengan parameter kata pencarian pemilu n=default (25), batasan waktu tertentu
pemilu_april_2019 <- searchTwitter('pemilu', since = "2019-4-1", until = "2019-4-30")
df_pemilu_april_2019 <- do.call("rbind", lapply(pemilu_april_2019, as.data.frame))
view(df_pemilu_april_2019)
write.csv(df_pemilu_april_2019, file ='C:/Users/RAFII/Documents/UAS_BIGDATA/UAS_BIGDATA/pemilu_april_2019.csv',row.names = F)

#ALTERNATIF 2 : MENGGUNAKAN GEOCODE
#pencarian tweet dengan parameter pencarian "pemilu"
#yang berada pada radius 2 mil (boleh diganti dg km)
#dr titik kordinat tsb

pemilu_jogja = searchTwitter('pemilu', geocode="-7,792351,110.365935,50km", n = 100)
df_pemilu_jogja <- do.call("rbind", lapply(pemilu_jogja, as.data.frame))
View(df_pemilu_jogja)
write.csv(df_pemilu_jogja, file ='C:/Users/RAFII/Documents/UAS_BIGDATA/UAS_BIGDATA/pemilu_jogja.csv',row.names = F)

# alternatif 3; menggunakan usertimeline
kpu<-userTimeline('kpu_id' ,n=100)
df_kpu <-do.call("rbind",lapply(kpu, as.data.frame))
View(df_kpu)
write.csv(df_kpu, file ='C:/Users/RAFII/Documents/UAS_BIGDATA/UAS_BIGDATA/df_kpu.csv',row.names = F)


#tahap sentiment analysis
pos = scan('C:/Users/RAFII/Documents/UAS_BIGDATA/UAS_BIGDATA/positive.txt',what = 'character',comment.char = ';')


neg = scan('C:/Users/RAFII/Documents/UAS_BIGDATA/UAS_BIGDATA/negative.txt',what = 'character',comment.char = ';')
