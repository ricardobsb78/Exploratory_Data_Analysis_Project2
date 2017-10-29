NEI <- readRDS("dataStore/summarySCC_PM25.rds")
SCC <- readRDS("dataStore/Source_Classification_Code.rds")

library('data.table')
library('ggplot2')

df <- data.table(NEI)

# filtering dataset to only include Baltimore with type equal to 'ON-ROAD'

data <- subset(df, fips %in% c('06037', '24510') & type == 'ON-ROAD')

by_year <- data[, list(emissions=sum(Emissions)), by=c('year', 'fips')]

by_year$year = as.numeric(as.character(by_year$year))

by_year$emissions = as.numeric(as.character(by_year$emissions))

ggplot(data=by_year, aes(x=year, y=emissions, col=fips)) + geom_line() + geom_point() + ggtitle("Emissions from Motor Vehicles in Baltimore City compared to Los Angeles")

dev.copy(png, file="plot6.png", width=480, height=480)

dev.off()