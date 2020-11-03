#' 2019 Political candidates running for office
#'
#' This package contains political candidates running
#' for office across all levels of government in 2019
#' @docType package
#' @name Candidates2019
#' @aliases Candidates Candidates-package
NULL

#' "Candidates2019"
#'
#' A data set containing political candidates
#' running for different offices across all levels of
#' government and their outcomes in 2019
#'
#' @source \url{https://wholeads.us/}
#' @format A dataframe with 33925 elements and 13 variables
#' \describe{
#'    \item{candidate_id}{unique identifier for each candidate}
#'    \item{state}{state candidate ran in}
#'    \item{office_level}{level of office candidate ran for}
#'    \item{office_role}{specific role candidate ran for}
#'    \item{electoral_district}{district candidate ran in}
#'    \item{office_name}{specific name of the office the candidate ran for}
#'    \item{seat_type}{type of seat the candidate ran for}
#'    \item{number_elected}{number of times the candidate will have been in office if elected}
#'    \item{candidate_name}{name of candidate}
#'    \item{candidate_party}{party of candidate}
#'    \item{party_roll_up}{party of the candidate on the official ballot}
#'    \item{race}{race of the candidate}
#'    \item{gender}{gender of the candidate}
#'    \item{election_result}{whether or not candidate won their election}
#' }
"Candidates2019"

