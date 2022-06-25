install.packages("nflfastR")
library(nflfastR)
library(tidyverse)
library(alr4)
update.packages()


nfl2020 <- nflfastR::fast_scraper_schedules(2020)
two_weeks <- nfl2020 %>% filter(week == "1" | week == "2")
plays <- nflfastR::fast_scraper(two_weeks$game_id)

shotgun <- plays %>% filter(shotgun == "1")
no_shotgun <- plays %>% filter(shotgun == "0")

summary(shotgun$yards_gained)
summary(no_shotgun$yards_gained)


clean <- plays %>% select(week, home_team, away_team, home_score, away_score, play_id, 
                          play_type, passer_player_name, receiver_player_name, air_yards, 
                          shotgun, ydstogo, complete_pass, yards_gained, td_prob, first_down_pass, 
                          first_down_rush, touchdown)
passPlays <- clean %>% filter(play_type == "pass")
runPlays <- clean %>% filter(play_type == "run")

terry <- passPlays %>% filter(receiver_player_name == "T.McLaurin")
MicaelThomas <- passPlays %>% filter(receiver_player_name == "M.Thomas") %>% 
  filter(passer_player_name == "D.Brees")
hopkins <- passPlays %>% filter(receiver_player_name == "D.Hopkins") %>% 
  filter(passer_player_name == "K.Murray")
