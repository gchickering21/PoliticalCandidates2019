library(tidyverse)
Candidates2019 <- readr::read_csv("candidates_rd2019.csv") %>%
  janitor::clean_names() %>%
  rename(
    candidate_id = candidate_uuid,
    party_roll_up = party_id_roll_up
  ) %>%
  select(candidate_id, state, office_level, office_role,
         electoral_district, office_name, number_elected, candidate_name,
         candidate_party, party_roll_up, race, gender, winner_y_n)
usethis::use_data(Candidates2019)
