NEI <- readRDS("dataStore/summarySCC_PM25.rds")
SCC <- readRDS("dataStore/Source_Classification_Code.rds")

library('data.table')

df <- data.table(NEI)

baltimore <- subset(df, fips == '24510')

by_year <- baltimore[, list(emissions=sum(Emissions)), by=year]

by_year$year = as.numeric(as.character(by_year$year))

by_year$emissions = as.numeric(as.character(by_year$emissions))

plot(by_year$year, by_year$emissions,type='o', pch=19, col="darkblue", ylab='Emissions', xlab='Year',main = "Total PM2.5 in Baltimore City, MD emissions at various years")

dev.copy(png, file="plot2.png", width=480, height=480)

dev.off()