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

## Question 4:


# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?


# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

## Aggregate total emissions by year.
TotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)


#Create the plot.
png("plot4.png", width=640, height=480)
z <- ggplot(TotalByYear, aes(factor(year), Emissions))
z <- z + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions: Coal sources from 1999 to 2008')
print(z)

#Turn off the device.
dev.off()






