#scraping Website
URL = "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"

#importing libraries
library(robotstxt)
library(rvest)

#checking website allowability
path = paths_allowed(URL)

#Reading html elements
web <- read_html(URL)

#segregating names
name <- web %>% html_nodes(".lister-item-header a") %>% html_text()
View(name)

#segregating Year

year <- web %>% html_nodes(".text-muted.unbold") %>% html_text()
View(year)
#Segregating Ratings

rating <- web %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
View(rating)

# Segregating run time
runtime <- web %>% html_nodes(".runtime") %>% html_text()
View(runtime)

# Segregating genre
genre <- web %>% html_nodes(".genre") %>% html_text()
View(genre)

#Data Frame Creation
imdb.rating <- data.frame(name,year,rating,genre,runtime)
View(imdb.rating)

#saving the data frame
write.csv(imdb.rating,"Movie_data.csv")
