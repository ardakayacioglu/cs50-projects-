# Load the data from tests.tsv
tests <- read.table("tests.tsv", header = TRUE, sep = "\t")

# Convert gender numeric to text
# According to codebook.txt: 1 = Male, 2 = Female, anything else = Other
tests$gender <- ifelse(tests$gender == 1, "Male",
                       ifelse(tests$gender == 2, "Female", "Other"))

# Calculate trait scores by averaging relevant columns (sum / 15)
tests$extroversion <- round((tests$E1 + tests$E2 + tests$E3) / 15, 2)
tests$neuroticism <- round((tests$N1 + tests$N2 + tests$N3) / 15, 2)
tests$agreeableness <- round((tests$A1 + tests$A2 + tests$A3) / 15, 2)
tests$conscientiousness <- round((tests$C1 + tests$C2 + tests$C3) / 15, 2)
tests$openness <- round((tests$O1 + tests$O2 + tests$O3) / 15, 2)

# Write output to analysis.csv
write.csv(tests, "analysis.csv", row.names = FALSE)
