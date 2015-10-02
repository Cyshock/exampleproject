#!/usr/bin/env Rscript
#Title: R plotting continents
#Author: Mr MR
#Date: 2nd October 2015
#Version: 0.01

#call package
# you can check if it is installled wiht a condition before calling the packkage ggplot2

#extra comments
#more comments
# and yet more coomments

#and more


library(ggplot2)
#assume you have a data/gapminder.RData, add a condition later or read the data from a csv

load("data/gapminder.RData")

#create function to plot dots per continent
#recieves a dataframe input and makes a plot
draw_dots_continent <- function(df){
  #plot the continents multifigure
  p <- ggplot(data=df,aes(x=year, y=lifeExp, color=country))+ 
        geom_point(aes(color=continent)) + 
        ggtitle("Life Exp by year") +
        facet_grid(.~ continent)
  print(p)
}

#create a function to create png plot
make_pngplot <- function(name){
  png(file=paste(name,".png",sep=""))
  draw_dots_continent(gapminder)
  dev.off()
}

#how to receive input from the user
arg <- commandArgs(TRUE)
try(make_pngplot(arg[1]))

#end comment
