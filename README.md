
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PoliticalCandidates2019

<!-- badges: start -->

![R-CMD-check](https://github.com/gchickering21/PoliticalCandidates2019/workflows/R-CMD-check/badge.svg)
<!-- badges: end -->

The goal of PoliticalCandidates2019 is to be able to provide a framework
to work with data that contains information on those that ran and for
political offices all across the country at all the different levels of
government and whether or not they won their race. The data available in
this package also contains demographic information of the candidates
themselves such as race and gender as well as the party they chose to
affiliate themselves with. This data can be useful in being able to see
and answer questions that breakdown these candidates by areas such as by
levels of office, by state, by party, or by gender just to list a few
examples.

### Installation

You can install the development version of PoliticalCandidates2019 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("gchickering21/PoliticalCandidates2019")
```

### Examples

These are a few basic examples which shows you the type of questions
that can be answered by looking at this dataset.

``` r
library(PoliticalCandidates2019)
library(tidyverse)
options(dplyr.summarise.inform = FALSE)
library(knitr)
library(kableExtra)
```

This is an example showing how you can see the gender breakdown of who
ran for positions at all levels of government.

``` r
gender_percents <- PoliticalCandidates2019 %>%
  select(gender) %>% 
  filter(gender != "unknown" & gender != "other" ) %>% 
  group_by(gender) %>%
  summarize(count = n()) %>%
  mutate(percentage = count / sum(count) * 100, percentage=round(percentage,2))
knitr::kable(gender_percents)
```

<table>

<thead>

<tr>

<th style="text-align:left;">

gender

</th>

<th style="text-align:right;">

count

</th>

<th style="text-align:right;">

percentage

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

female

</td>

<td style="text-align:right;">

10742

</td>

<td style="text-align:right;">

32.67

</td>

</tr>

<tr>

<td style="text-align:left;">

male

</td>

<td style="text-align:right;">

22137

</td>

<td style="text-align:right;">

67.33

</td>

</tr>

</tbody>

</table>

This is another example where we can see the racial demographics of the
different types of candidates running for office.

``` r
race_percents <- PoliticalCandidates2019 %>%
  select(race) %>%
  filter(race != "unknown") %>%
  group_by(race) %>%
  summarize(count = n()) %>%
  mutate(percentage = count / sum(count) * 100, percentage=round(percentage,2)) %>%
  arrange(desc(percentage))
knitr::kable(race_percents)
```

<table>

<thead>

<tr>

<th style="text-align:left;">

race

</th>

<th style="text-align:right;">

count

</th>

<th style="text-align:right;">

percentage

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

white

</td>

<td style="text-align:right;">

28577

</td>

<td style="text-align:right;">

88.44

</td>

</tr>

<tr>

<td style="text-align:left;">

black or african american

</td>

<td style="text-align:right;">

2029

</td>

<td style="text-align:right;">

6.28

</td>

</tr>

<tr>

<td style="text-align:left;">

hispanic or latino

</td>

<td style="text-align:right;">

1076

</td>

<td style="text-align:right;">

3.33

</td>

</tr>

<tr>

<td style="text-align:left;">

asian american or pacific islander

</td>

<td style="text-align:right;">

361

</td>

<td style="text-align:right;">

1.12

</td>

</tr>

<tr>

<td style="text-align:left;">

american indian or alaska native

</td>

<td style="text-align:right;">

128

</td>

<td style="text-align:right;">

0.40

</td>

</tr>

<tr>

<td style="text-align:left;">

multiracial

</td>

<td style="text-align:right;">

106

</td>

<td style="text-align:right;">

0.33

</td>

</tr>

<tr>

<td style="text-align:left;">

other

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:right;">

0.11

</td>

</tr>

</tbody>

</table>

This is another example that shows a breakdown of how often a party won
a race, broken down by the different levels of government.

``` r
level_party_percents <- PoliticalCandidates2019 %>%
  select(office_level, party_roll_up, winner_y_n) %>%
  filter((party_roll_up == "Democratic" | party_roll_up == "Republican" 
          | party_roll_up == "Independent") & winner_y_n == "Yes") %>%
  group_by(office_level, party_roll_up) %>%
  summarize(count = n()) %>%
  mutate(percentage = count / sum(count) * 100, percentage=round(percentage,2)) %>%
  select(office_level, party_roll_up, percentage)


level_party_percents %>%
  pivot_wider(names_from = "party_roll_up", values_from = "percentage") %>%
  arrange(desc(office_level)) %>% knitr::kable()
```

<table>

<thead>

<tr>

<th style="text-align:left;">

office\_level

</th>

<th style="text-align:right;">

Democratic

</th>

<th style="text-align:right;">

Independent

</th>

<th style="text-align:right;">

Republican

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

regional

</td>

<td style="text-align:right;">

49.35

</td>

<td style="text-align:right;">

2.60

</td>

<td style="text-align:right;">

48.05

</td>

</tr>

<tr>

<td style="text-align:left;">

locality

</td>

<td style="text-align:right;">

25.42

</td>

<td style="text-align:right;">

70.76

</td>

<td style="text-align:right;">

3.81

</td>

</tr>

<tr>

<td style="text-align:left;">

country

</td>

<td style="text-align:right;">

54.89

</td>

<td style="text-align:right;">

0.64

</td>

<td style="text-align:right;">

44.47

</td>

</tr>

<tr>

<td style="text-align:left;">

administrativeArea2

</td>

<td style="text-align:right;">

27.06

</td>

<td style="text-align:right;">

10.32

</td>

<td style="text-align:right;">

62.62

</td>

</tr>

<tr>

<td style="text-align:left;">

administrativeArea1

</td>

<td style="text-align:right;">

47.49

</td>

<td style="text-align:right;">

1.86

</td>

<td style="text-align:right;">

50.65

</td>

</tr>

</tbody>

</table>

This is another example of a type of plot that could be generated by the
data in this package where we examine the relationship between number of
times elected by race for the different political parties.

``` r
ggplot(PoliticalCandidates2019, aes(x = number_elected, y = race, color = party_roll_up)) +
  geom_point(position = position_jitter(width = 0.2, height = 0.4)) +
  labs(x = "Number of Times Elected", y = "Race", title = "Race and Being Elected")
#> Warning: Removed 68 rows containing missing values (geom_point).
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

This is one last example that shows how one can examine the relationship
between number of times elected by race at the different levels of
government.

``` r
ggplot(PoliticalCandidates2019, aes(x = number_elected, y = office_level, color = race)) +
  geom_point(position = position_jitter(width = 0.15, height = 0.3)) +
  labs(x = "Number of Times Elected", y = "Race", title = "Race at Different Levels of Gov't")
#> Warning: Removed 68 rows containing missing values (geom_point).
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />
These are just a couple examples of the types of information that can be
drawn and the analysis that can be done with the data from this R
Package.
