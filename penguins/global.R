library(shiny)
library(tidyverse)
library(glue)
library(DT)

penguins <- read_csv("../data/penguins.csv")

islands <- penguins |> 
    distinct(island) |> 
    arrange(island) |> 
    pull()