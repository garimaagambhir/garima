getwd()
setwd("D:\\DocsJob\\MS\\project\\R\\R-final-project")
getwd()
movies<-read.csv("movies.csv")
#colnames(mydf)[18]
colnames(movies)[18]<-"GrossPercentUS"
colnames(movies)[8]<-"BudgetInMillions"


#summary(mydf)
#filter your df

mydf<-movies[(movies$Genre=="action" | movies$Genre =="drama"| movies$Genre =="adventure"| movies$Genre =="animation"| movies$Genre =="comedy")
  & (movies$Studio=="Buena Vista Studios" | movies$Studio=="Fox" | movies$Studio=="WB" | movies$Studio=="Sony" | movies$Studio=="Universal"),]
mydf
colnames(movies)
library(ggplot2)
plt<-ggplot(data=mydf, aes(x=Genre, y=GrossPercentUS))


q<-plt+ geom_jitter(aes(size=BudgetInMillions,color=Studio)) + geom_boxplot(alpha=0.7,outlier.colour = NA) 


q<-q+ggtitle("Domestic Gross %") +theme(axis.title.x=element_text(color="Blue",size=10),
                                        axis.title.y=element_text(color="Blue",size=10),
                                        axis.text.x=element_text(color="Blue",size=8),
                                        axis.text.y=element_text(color="Blue",size=8),
                                        plot.title=element_text(size=20,family = "Comic Sans MS"),
                                        legend.title = element_text(color="red",size=6.5),
                                        legend.text = element_text(color="black",size=5),
                                        legend.position = c(0.97,0.23),
                                        legend.key.size = unit(0.1, "cm"),  # Adjusting the size of the legend keys
                                        legend.key.height = unit(0.1, "cm"),
                                        legend.spacing = unit(0.1, "cm")  )
q

