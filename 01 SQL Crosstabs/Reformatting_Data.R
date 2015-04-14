setwd("~/Desktop/SPRING14/CS329E/DV_TableauProject2/01 SQL Crosstabs")
file_path <- "Gender_Specific_Toy_Preference.csv"

measures <- c("Age", "Gender", "Latitude", "Longitude", "PSAI_M", "PSAI_F", "PSAI_Total", "Mtoy", "Ftoy", "BEM_Masc", "BEM_Fem")

df <- read.csv(file_path, stringsAsFactors = FALSE)

#Replace "." with "_"
names(df) <- gsub("\\.+", "_", names(df))

#Delete rows with NA data
df <- na.omit(df)

#Write out reformatted data
write.csv(df, paste(gsub(".csv", "", file_path), ".reformatted.csv", sep=""), row.names=FALSE)
