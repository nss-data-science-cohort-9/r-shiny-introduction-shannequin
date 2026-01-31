library(shiny)
library(tidyverse)
library(sf)
library(glue)
library(DT)

burglaries <- read_csv("../data/burglaries_2023.csv")
census <- read_csv(file = "../data/census.csv")
DC <- st_read("../data/DC")

# Convert burglaries tibble to a simple-features-object
burglaries <-burglaries |>
    drop_na(longitude) |>
    drop_na(latitude) |> 
    st_as_sf(
        coords = c("longitude", "latitude"),
        crs = st_crs(DC),
        remove = FALSE
    )

# Merge census tibble and DC spacial-type-object
census <- left_join(x = DC,
                    y = census|> mutate(state = as.character(state)),
                    by = join_by(STATEFP == state, COUNTYFP == county, TRACTCE == tract))

census_burglaries <- st_join(x = census,
                             y = burglaries,
                             join = st_contains)
