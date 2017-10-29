NEI <- readRDS("dataStore/summarySCC_PM25.rds")
SCC <- readRDS("dataStore/Source_Classification_Code.rds")

library('data.table')

df <- data.table(NEI)

by_year <- df[, list(emissions=sum(Emissions)), by=year]

by_year$year = as.numeric(as.character(by_year$year))

by_year$emissions = as.numeric(as.character(by_year$emissions))

plot(by_year$year, by_year$emissions, type='o', pch=19, col="darkblue", ylab="Emissions", xlab="Year",main = "Total PM2.5 emissions at various years")

dev.copy(png, file="plot1.png", width=480, height=480)

dev.off()