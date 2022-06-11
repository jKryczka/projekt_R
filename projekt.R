library(quantmod) #biblioteka za pomoc¹ której pobieramy dane
library(rvest) #biblioteka któr¹ wykorzystujemy do webscrapingu 


html1 <-read_html("https://en.wikipedia.org/wiki/List_of_S%26P_500_companies") 
ht<-html_table(html1)
tabela<-ht[[1]]

tabela$Symbol[65] <- "BRK-B"
tabela$Symbol[81] <- "BF-B" #dokonujemy korekt koniecznych ze wzglêdu na ró¿nice w zapisie symboli spó³ek 
symbole <- tabela$Symbol #pobieramy tabelê symboli spó³ek które nas interesuj¹
getSymbols(symbole,source = "yahoo",from = "2020-01-01",to="2022-01-31") #pobieramy dane
nazwy_wierszy<- rownames(A)
symbole1 <- unique(tabela$`GICS Sector`)

Industrials <- tabela$Symbol[tabela$`GICS Sector`=="Industrials"]
`Health Care` <- tabela$Symbol[tabela$`GICS Sector`=="Health Care"]
`Information Technology`<- tabela$Symbol[tabela$`GICS Sector`=="Information Technology"]
`Communication Services` <- tabela$Symbol[tabela$`GICS Sector`=="Communication Services"]
`Consumer Staples` <- tabela$Symbol[tabela$`GICS Sector`=="Consumer Staples"]
`Consumer Discretionary` <- tabela$Symbol[tabela$`GICS Sector`=="Consumer Discretionary"]
Utilities <- tabela$Symbol[tabela$`GICS Sector`=="Utilities"]
Financials <- tabela$Symbol[tabela$`GICS Sector`=="Financials"]
Materials <- tabela$Symbol[tabela$`GICS Sector`=="Materials"]
`Real Estate` <- tabela$Symbol[tabela$`GICS Sector`=="Real Estate"]
Energy <- tabela$Symbol[tabela$`GICS Sector`=="Energy"] #grupujemy dane o spó³kach ze wzglêdu na ich 



for (i in 1:(length(symbole))){
    assign(symbole[i],as.data.frame(get(symbole[i])))
    assign(symbole[i],get(symbole[i])[c(1:504),4]) 
}


   
nazwy_sektorów <-c("przemys³","opieka zdrowotna","IT","us³ugi komunikacyjne",
  "podstawowe produkty konsumenckie","towary luksusowe","media",
  "finanse","materia³y","nieruchomoœci","energia")

for (i in 1:11){
  assign(nazwy_sektorów[1],do.call("data.frame",as.list(get(symbole1[i]))))
  
}
get(get(unique(tabela$`GICS Sector`)[1])) 
  
?do.call
?as.name
get(symbole1)
A<-as.data.frame(A)
list(as.name(get(symbole1[1])))

