

## Read in the NEI data file. 
if(!exists("NEI")){
  NEI <- readRDS("C:/Users/20292/Desktop/Exploratory Data Analysis/exdata-data-NEI_data/summarySCC_PM25.rds")
}

## Read in the SCC Data file. 
if(!exists("SCC")){
  SCC <- readRDS("C:/Users/20292/Desktop/Exploratory Data Analysis/exdata-data-NEI_data/Source_Classification_Code.rds")
}

##Check that the data is correct.
head(NEI)
head(SCC)

# Load the ggplo2 package.
library(ggplot2)

############################################################################################

## Question 3:

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 


## Subset the Baltimore, Maryland data by FIPS code.
MarylandNEI <- NEI[NEI$fips == "24510", ] 

#Aggregate total Balitmore emissions data by year and type. 
BaltimoreYearAndType <- aggregate(Emissions ~ year + type, MarylandNEI, sum)

#Create the plot. 
png("plot3.png", width=640, height=480)
z <- ggplot(BaltimoreYearAndType, aes(year, Emissions, color = type))
z <- z + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')
print(z)

#Turn off the device.
dev.off()







