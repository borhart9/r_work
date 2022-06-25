library("nflfastR")
library("tidyverse")

nfl2020 <- nflfastR::fast_scraper_schedules(2020)

browns <- nfl2020 %>% filter(home_team == "CLE" | away_team == "CLE")

plays_browns <- nflfastR::fast_scraper(browns$game_id)

J_Landry <- plays_browns %>% select(week, side_of_field, yrdln, ydstogo, time, qtr, down, 
                                  desc, yards_gained, air_yards, yards_after_catch, 
                                  touchdown, complete_pass, passer_player_name, receiver_player_name) %>% 
  filter(receiver_player_name == "J.Landry")

receptions <- sum(J_Landry$complete_pass)
targets <- length(J_Landry$desc)
receiving_yards <- sum(J_Landry$yards_gained)
receiving_TDs <- sum(J_Landry$touchdown)
