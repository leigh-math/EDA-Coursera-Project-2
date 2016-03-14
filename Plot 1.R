

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

############################################################################################

## Question 1:

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

## Aggreate Emmissions by year. 
TotalByYear <- aggregate(Emissions ~ year, NEI, sum)


#Create the plot. 
png('plot1.png')
barplot(height=TotalByYear$Emissions, names.arg=TotalByYear$year, xlab="Years", ylab=expression('Total PM'[2.5]*' Emission'),main=expression('Total PM'[2.5]*' Emissions at Different Years'))

#Turn off the device.
dev.off()

