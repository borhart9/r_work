library("nflfastR")
library(tidyverse)

nfl2020 <- nflfastR::fast_scraper_schedules(2020)
nfl2020Rosters <- nflfastR::fast_scraper_roster(2020)

bearsRoster <- nfl2020Rosters %>% filter(nfl2020Rosters$team == "CHI")
bearsGames <- nfl2020 %>% filter(nfl2020$away_team == "CHI" | nfl2020$home_team == "CHI")
plays <- nflfastR::fast_scraper(bearsGames$game_id)


pbp <- nflfastR::load_pbp(2020)
