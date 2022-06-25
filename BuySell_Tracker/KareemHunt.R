library("nflfastR")
library("tidyverse")

nfl2020 <- nflfastR::fast_scraper_schedules(2020)

browns <- nfl2020 %>% filter(home_team == "CLE" | away_team == "CLE")

plays_browns <- nflfastR::fast_scraper(browns$game_id)

K_Hunt <- plays_browns %>% select(week, side_of_field, yrdln, ydstogo, time, qtr, down, 
                                   desc, yards_gained, air_yards, yards_after_catch, 
                                  touchdown, complete_pass, passer_player_name, receiver_player_name, 
                                  rusher_player_name) %>% 
  filter(receiver_player_name == "K.Hunt")

receptions <- sum(K_Hunt$complete_pass)
targets <- length(K_Hunt$desc)
receiving_yards <- sum(K_Hunt$yards_gained)
receiving_TDs <- sum(K_Hunt$touchdown)
