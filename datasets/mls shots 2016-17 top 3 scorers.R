# Data acquired from https://www.americansocceranalysis.com/asa-xgoals/
# This data reflects 3 years (2015-2017) worth of Bradley Wright Phillips shots data non PK, non FK shots and goals.
# This data reflects Josef Martinez's 2017 season of non PK/FK shots and goals data.
# This data reflects Nemanja Nikolic's 2017 season of non PK/FK shots and goals data.
# Will compare finishing rate's between the leading goal scorer in MLS from the past 3 years
# in Wright-Phillips vs. the 2 top goalscoring newcomers to MLS in the year 2017, Nikolic and Martinez. 
mls_shots_data_16_17 <- data.frame(y = c(rep(0,237), rep(1, 56), rep(0, 44), rep(1, 17), rep(0, 93), rep(1, 20)),
                         s = c(rep("Wright-Phillips", 293), rep("Martinez", 61), rep("Nikolic", 113)))

readr::write_csv(x = mls_shots_data_16_17, path = "/Users/bhoeft/Desktop/temp/datasets/mls_goalscoring_data.csv")
