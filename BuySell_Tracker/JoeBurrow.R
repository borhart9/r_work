library("nflfastR")
library("tidyverse")

nfl2020 <- nflfastR::fast_scraper_schedules(2020)

bengals <- nfl2020 %>% filter(home_team == "CIN" | away_team == "CIN")

plays_bengals <- nflfastR::fast_scraper(bengals$game_id)

J_Burrow <- plays_bengals %>% select(week, side_of_field, yrdln, ydstogo, time, qtr, down, 
                                desc, yards_gained, air_yards, yards_after_catch, 
                                touchdown, complete_pass, passer_player_name, receiver_player_name) %>% 
  filter(passer_player_name == "J.Burrow")

completions <- sum(J_Burrow$complete_pass)
passing_yards <- sum(J_Burrow$yards_gained) 
passing_TDs <- sum(J_Burrow$touchdown)
