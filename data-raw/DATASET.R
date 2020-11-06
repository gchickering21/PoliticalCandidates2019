library(tidyverse)
PoliticalCandidates2019 <- readr::read_csv("candidates_rd2019.csv") %>%
  janitor::clean_names() %>%
  rename(
    candidate_id = candidate_uuid,
    party_roll_up = party_id_roll_up
  ) %>%
  select(
    candidate_id, state, office_level, office_role,
    electoral_district, office_name, number_elected, candidate_name,
    candidate_party, party_roll_up, race, gender, winner_y_n
  ) %>%
  mutate(
    race = tolower(race), gender = tolower(gender), candidate_party = tolower(candidate_party),
    race = gsub("african-american", "african american", race),
    party_roll_up = gsub("Democratic Party", "Democratic", party_roll_up, ignore.case = TRUE),
    party_roll_up = gsub("Republican Party", "Republican", party_roll_up, ignore.case = TRUE)
  )

usethis::use_data(PoliticalCandidates2019)

