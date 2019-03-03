knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
# Install from CRAN
#install.packages("CGPfunctions")

# Or the development version from GitHub
#install.packages("devtools")
# devtools::install_github("ibecav/CGPfunctions")
library(CGPfunctions)

order_products_train <- fread('C:/Users/JAINHEMANT/Desktop/order_products.csv')
products <- fread('C:/Users/JAINHEMANT/Desktop/Coursera Courses/products.csv')

newggslopegraph(newcancer, Year, Survival, Type)

newggslopegraph(dataframe = newcancer,
                Times = Year,
                Measurement = Survival,
                Grouping = Type,
                Title = "Estimates of Percent Survival Rates",
                SubTitle = "Based on: Edward Tufte, Beautiful Evidence, 174, 176.",
                Caption = NULL
)


moredata <- structure(list(Date = structure(c(1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 3L, 3L, 3L, 3L, 3L), 
                                            .Label = c("11-May-18", "18-May-18", "25-May-18"), 
                                            class = "factor"), 
                           Party = structure(c(5L, 3L, 2L, 1L, 4L, 5L, 3L, 2L, 1L, 4L, 5L, 3L, 2L, 1L, 4L), 
                                             .Label = c("Green", "Liberal", "NDP", "Others", "PC"), 
                                             class = "factor"), 
                           Pct = c(42.3, 28.4, 22.1, 5.4, 1.8, 41.9, 29.3, 22.3, 5, 1.4, 41.9, 26.8, 26.8, 5, 1.4)), 
                      class = "data.frame", 
                      row.names = c(NA, -15L))
newggslopegraph(moredata,
                Date,
                Pct,
                Party, 
                Title = "Notional data", 
                SubTitle = NULL, 
                Caption = NULL)
#> 
#> Converting 'Date' to an ordered factor


newggslopegraph(moredata, Date, Pct, Party, 
                Title = "Notional data", 
                SubTitle = "none", 
                Caption = "imaginary",
                LineColor = "gray", 
                LineThickness = .5,
                YTextSize = 4
)

#Converting 'Date' to an ordered factor


newggslopegraph(moredata, Date, Pct, Party, 
                Title = "Notional data", 
                SubTitle = "none", 
                Caption = "imaginary",
                LineColor = c("Green" = "gray", "Liberal" = "green", "NDP" = "red", "Others" = "gray", "PC" = "gray"), 
                LineThickness = .5,
                YTextSize = 4
)
#> 
#> Converting 'Date' to an ordered factor

newggslopegraph(dataframe =newgdp, 
                Year, 
                GDP, 
                Country, 
                Title = "Gross GDP", 
                SubTitle = NULL, 
                Caption = NULL,
                LineThickness = .5,
                YTextSize = 4,
                LineColor = c(rep("gray",3), "red", rep("gray",3), "red", rep("gray",10))
)


newggslopegraph(dataframe = newcancer,
                Times = Year,
                Measurement = Survival,
                Grouping = Type,
                Title = "Estimates of Percent Survival Rates",
                SubTitle = "Based on: Edward Tufte, Beautiful Evidence, 174, 176.",
                Caption = NULL,
                YTextSize = 2.5,
                LineThickness = .5,
                LineColor = c("red", rep("gray",4), "red", rep("gray",3))
                #WiderLabels = TRUE
)
#> 
#> You gave me 9 colors I'm recycling colors because you have 24 Types