#----------
#Part 1 – Data Preparation
#----------
#Set the working directory to where feedback.txt is stored.
setwd("C:/rprogramming")

install.packages(c("tm", "SnowballC", "wordcloud", "RColorBrewer"))
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

#Read the file into R using readLines().
text <- readLines("feedback.txt", encoding = "UTF-8", warn = FALSE)

#Create a Corpus from the imported text.
corpus <- Corpus(VectorSource(text))

# Clean the text with the following steps:
# Convert to lowercase
corpus <- tm_map(corpus, content_transformer(tolower))
# Remove numbers
corpus <- tm_map(corpus, removeNumbers)
# Remove punctuation
corpus <- tm_map(corpus, removePunctuation)
# Remove English stopwords
corpus <- tm_map(corpus, removeWords, stopwords("english"))
# Strip whitespace
corpus <- tm_map(corpus, stripWhitespace)
# Stem the words
corpus <- tm_map(corpus, stemDocument)

#----------
#Part 2 – Word Frequency Analysis
#----------

# Create a Term-Document Matrix.
tdm <- TermDocumentMatrix(corpus)
# Convert the matrix to a data frame of word frequencies.
m <- as.matrix(tdm)
# Display the top 10 most frequent words.
word_freqs <- sort(rowSums(m), decreasing = TRUE)

df <- data.frame(
  word = names(word_freqs),
  freq = word_freqs,
  row.names = NULL
)

head(df, 10)
#-----result-----
#       word     freq
# 1     pero      173
# 2      ang      132
# 3    staff      105
# 4    offic       99
# 5      met       97
# 6    maayo       62
# 7   govern       51
# 8  serbisyo      49
# 9  process       44
# 10    mabag      43

#Write 3–5 sentences interpreting the results.
#-----answer-----
# The most common words in the feedback are "pero", "ang", 
# "staff", and "office", which shows that many comments talk 
# about the office staff and their service.
# The word "met" appears often because people use it casually 
# in Taglish or Pangasinan expression.
# Words like "maayo", "mabag", "serbisyo", and "process" show 
# that many people describe how fast or slow the service was.
# Overall, the feedback mostly talks about the quality of 
# service and the experience with the staff.


#----------
#Part 3 – Word Cloud Generation
#----------

# Generate a word cloud using the frequency data.
# Customize it:
# Minimum frequency: 2
# Maximum words: 1000
# Use Dark2 color palette from RColorBrewer
# Words displayed in decreasing frequency order
# Save the word cloud as wordcloud_exam.png with dimensions 800×600.

# Display word cloud on screen
set.seed(1234)
wordcloud(
  words = df$word,
  freq = df$freq,
  min.freq = 2,
  max.words = 1000,
  random.order = FALSE,
  rot.per = 0.35,
  scale = c(4, 0.5),
  colors = brewer.pal(8, "Dark2")
)

# Save the word cloud as PNG
png("wordcloud_exam.png", width = 800, height = 600)

set.seed(1234)
wordcloud(
  words = df$word,
  freq = df$freq,
  min.freq = 2,
  max.words = 1000,
  random.order = FALSE,
  rot.per = 0.35,
  scale = c(4, 0.5),
  colors = brewer.pal(8, "Dark2")
)

dev.off()


#----------
#Part 4 – Advanced Task
#----------

#Identify the 5 least frequent words (frequency = 1) and create a separate word cloud for them.

# Get words that appear only once
rare_words <- subset(df, freq == 1)

# Select only 5 of them
least5 <- head(rare_words, 5)

# If there are at least 1 rare word, create the cloud
if (nrow(least5) > 0) {
  
  png("wordcloud_rare.png", width = 800, height = 600)
  
  set.seed(1234)
  wordcloud(
    words = least5$word,
    freq = least5$freq,
    min.freq = 1,
    max.words = 5,
    random.order = TRUE,
    rot.per = 0.35,
    scale = c(4, 0.8),
    colors = brewer.pal(8, "Dark2")
  )
  
  dev.off()
  
} else {
  
  # Safety message if your dataset ends up with no frequency 1 words
  message("There are no words with frequency = 1 in this dataset.")
}
