library(rvest)
library(xml2)
library(magrittr)

wiki_pop <- 'https://en.wikipedia.org/wiki/List_of_power_stations_in_India'

wiki_pop <- read_html(wiki_pop)

global_pop <- wiki_pop %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div/div[5]/div[2]/table') %>%
  html_table()


global_pop <- global_pop[[1]]

head(global_pop,n=5)

names(global_pop) <- c("Power_Station","Operator","Establishment_Date","Location","District","State","Reactor_Units(MW)","Installed_Capacity(MW)","Under_Construction(MW)","Coordinates")
colnames(global_pop)


global_pop$Power_Station <- gsub('\[.*?\]', '', global_pop$Power_Station)
global_pop$Operator <- gsub('\[.*?\]', '', global_pop$Operator)
global_pop$Establishment_Date <- gsub('\[.*?\]', '', global_pop$Establishment_Date)
global_pop$Location <- gsub('\[.*?\]', '', global_pop$Location)
global_pop$Reactor_Units(MW) <- gsub('\[.*?\]', '', global_pop$Reactor_Units(MW))
global_pop$Installed_Capacity(MW) <- gsub('\[.*?\]', '', global_pop$Installed_Capacity(MW))
global_pop$Under_Construction(MW) <- gsub('\[.*?\]', '', global_pop$Under_Construction(MW))
global_pop$Coordinates <- gsub('\[.*?\]', '', global_pop$Coordinates)


head(global_pop$Coordinates)

write.csv(global_pop, "C:\\Users\\admin\\Desktop\\Nuclear_power.csv", row.names = FALSE)