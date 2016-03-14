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

## Question 5:

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Search for ON-ROAD type in NEI & 'motor' in SCC (non-cars)
## Subset the Baltimore data (fips == "25410")
BaltimoreNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

BaltTotalByYear <- aggregate(Emissions ~ year, BaltimoreNEI, sum)


#Create the plot.
png("plot5.png", width=840, height=480)
z <- ggplot(BaltTotalByYear, aes(factor(year), Emissions))
z <- z + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from "On-Road" motor vehicle in Baltimore City, Maryland from 1999 to 2008')
print(z)

#Turn off the device.
dev.off()

