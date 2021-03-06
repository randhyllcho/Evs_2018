library(tidyverse)
library(tidytext)

evs <- read.csv("Evs_2018.csv")

evs$detail <- as.character(evs$detail)

evs %>% 
  select(title, detail) %>% 
  unnest_tokens(word, detail) %>% 
  anti_join(stop_words) %>% 
  inner_join(get_sentiments('afinn')) %>% 
  group_by(title) %>% 
  summarise(score = sum(score)) %>% 
  arrange(desc(score)) %>% 
  View()


evs %>% 
  select(title, detail) %>% 
  unnest_tokens(word, detail) %>% 
  anti_join(stop_words) %>% 
  inner_join(get_sentiments('bing')) %>% 
  group_by(sentiment, title) %>% 
  count() %>% 
  arrange(desc(n), sentiment) %>% 
  View()
