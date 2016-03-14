## Plot 4

library(ggplot2)

## Read in the NEI data file. 
if(!exists("NEI")){
  NEI <- readRDS("C:/Users/20292/Desktop/Exploratory Data Analysis/exdata-data-NEI_data/summarySCC_PM25.rds")
}

## Read in the SCC Data file. 
if(!exists("SCC")){
  SCC <- readRDS("C:/Users/20292/Desktop/Exploratory Data Analysis/exdata-data-NEI_data/Source_Classification_Code.rds")
}

# merge the two data sets 
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}


############################################################################################

## Question 6:

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# FIPS codeing : 24510 = Baltimore, 06037 = LA


# Create a subset
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

## Aggregate total emissions by year
aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

#Create the plot.
png("plot6.png", width=1040, height=480)
z <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
z <- z + facet_grid(. ~ fips)
z <- z + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from "On-Road" motor vehicles in Baltimore City Vs. Los Angeles from 1999-2008')
print(z)



#Turn off the device.
dev.off()
