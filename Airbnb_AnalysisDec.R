# Anna Bogo u638869

## Load packages ---------------------------------------------------------------
library(dplyr)
library(ggplot2)
library(caret)
library(tidyr)

review <- read.delim("input/reviews.csv", stringsAsFactors = F, header = T,
                     sep =",")
dim(review)
head(review)

listings <- read.delim("input/listings.csv", stringsAsFactors = F, header = T,
                       sep = ",")
dim(listings)
head(listings)
glimpse(listings)

calendar <- read.delim('input/calendar.csv', stringsAsFactors = F, header = T,
                       sep = ",")
head(calendar)
glimpse(calendar)





# ------------------------------------------------------------------------------

#create cleaning function to predict prices

#clean prices in calendar

changedPrice <- function(badprice){
  price_numeric <- as.numeric(gsub('\\$|,','', as.character(badprice)))
}

calendar <- calendar %>% 
  mutate(price_num = changedPrice(price)) %>% 
  select(listing_id, date, available, price_num)


# delete redundant columns from listings: 
str(listings)

table(listings$ neighborhood_overview ,  useNA="always")

listings <- listings %>% 
  select(-matches("url|country|license|description|host_about|street|city|
                  smart_location|neighborhood_overview"))

listings %>% 
  select(reviews_per_month, property_type, room_type, price) %>% 
  arrange(desc(reviews_per_month))

glimpse(listings)

c("price", "weekly_price", "monthly_price", "security_deposit", "cleaning_fee", 
  "extra_people")

