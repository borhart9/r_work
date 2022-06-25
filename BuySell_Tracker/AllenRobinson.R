library("nflfastR")
library("tidyverse")

nfl2020 <- nflfastR::fast_scraper_schedules(2020)

bears <- nfl2020 %>% filter(home_team == "CHI" | away_team == "CHI")

plays_bears <- nflfastR::fast_scraper(bears$game_id)

A_Rob <- plays_bears %>% select(week, side_of_field, yrdln, ydstogo, time, qtr, down, 
                                  desc, yards_gained, air_yards, yards_after_catch, 
                                  touchdown, complete_pass, passer_player_name, receiver_player_name) %>% 
  filter(receiver_player_name == "A.Robinson")

receptions <- sum(A_Rob$complete_pass)
targets <- length(A_Rob$desc)
receiving_yards <- sum(A_Rob$yards_gained) 
receiving_TDs <- sum(A_Rob$touchdown)
