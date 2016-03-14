

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

## Question 2:

# Have total emissions from PM2.5 decreased in Baltimore City, Maryland (fips == "24510") from 1999 to 200*?


## Subset the Maryland data.
MarylandNEI <- NEI[NEI$fips == "24510", ] 

#Aggregate total Balitmore emissions data by year. 
MarylandTotalByYear <- aggregate(Emissions ~ year, MarylandNEI, sum)

#Create the plot. 
png('plot2.png')
barplot(height=MarylandTotalByYear$Emissions, names.arg=MarylandTotalByYear$year, xlab="Years", ylab=expression('Total PM'[2.5]*' Emission'),main=expression('Total PM'[2.5]*' in Baltimore City, Maryland Emissions by Year'))

#Turn off the device.
dev.off()

