# Population Dynamics Analysis

# Description: Statistical analysis and visualisation of Himalayan Vulture population trends

# Author: [Chanatip Ummee]

# License: MIT License

# Repository section: Population Dynamics

# Load required packages

library(tidyverse)
library(lme4)
library(broom)

# Load and prepare data

# Load dataset

setwd("C:/Users/msi/Desktop/R")
Population_Dynamics_Data <- read.csv("Population_Dynamics_Data.csv", encoding = "latin1")

# Select relevant columns

Population_Dynamics_Data <- Population_Dynamics_Data %>%
  select(Country, Area, Region, Year, No)

# Create new variable: Period (Pre-2006 vs Post-2006)

Population_Dynamics_Data <- Population_Dynamics_Data %>%
  mutate(Period = ifelse(Year <= 2006, "Pre2006", "Post2006"))

# Define factor levels

Population_Dynamics_Data$Area <- factor(
  Population_Dynamics_Data$Area,
  levels = c("Breeding", "Migration", "Non-breeding")
)

Population_Dynamics_Data$Region <- factor(
  Population_Dynamics_Data$Region,
  levels = c("Qinghai–Tibet Plateau", "South Asia", "Southeast Asia")
)

Population_Dynamics_Data$Period <- factor(
  Population_Dynamics_Data$Period,
  levels = c("Pre2006", "Post2006")
)

# (1) Population trends over time

ggplot(Population_Dynamics_Data, aes(x = Year, y = No, color = Region, shape = Area)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal(base_size = 14) +
  labs(
    title = "Population trends of Himalayan Vultures",
    y = "Count",
    x = "Year"
  )

# (2) Boxplot: Region × Period

ggplot(Population_Dynamics_Data, aes(x = Period, y = No, fill = Region)) +
  geom_boxplot() +
  theme_minimal(base_size = 14) +
  labs(
    title = "Counts before and after Diclofenac crisis",
    y = "Count",
    x = "Period"
  )

# (3) SA vs SEA counts over time

df_sa <- subset(Population_Dynamics_Data, Region == "South Asia")
df_sea <- subset(Population_Dynamics_Data, Region == "Southeast Asia")

df_merge <- merge(
  df_sa[, c("Year", "No")],
  df_sea[, c("Year", "No")],
  by = "Year",
  suffixes = c("_SA", "_SEA")
)

ggplot(df_merge, aes(x = Year)) +
  geom_line(aes(y = No_SA, colour = "South Asia"), linewidth = 1.2) +
  geom_line(aes(y = No_SEA, colour = "Southeast Asia"), linewidth = 1.2) +
  theme_minimal(base_size = 14) +
  labs(
    title = "SA vs SEA counts over time",
    y = "Counts",
    x = "Year",
    colour = "Region"
  )

# (4) ANOVA table from GLM

glm_model <- glm(
  No ~ Period * Area * Region,
  data = Population_Dynamics_Data,
  family = gaussian
)

anova_table <- tidy(anova(glm_model, test = "F"))
print(anova_table)

ggplot(data, aes(x = Period, y = No, fill = Region)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Counts before and after Diclofenac crisis")

# (5) SA vs SEA counts over time

df_sa <- data %>%
  filter(Region == "South Asia") %>%
  select(Year, No) %>%
  rename(No_SA = No)

df_sea <- data %>%
  filter(Region == "Southeast Asia") %>%
  select(Year, No) %>%
  rename(No_SEA = No)

df_merge <- merge(df_sa, df_sea, by = "Year")

# SA vs SEA counts

ggplot(df_merge, aes(x = No_SA, y = No_SEA, colour = Year)) +
  geom_point(size = 3) +
  geom_smooth(
    method = "lm",
    se = TRUE,
    colour = "black",
    fill = "grey70"
  ) +
  scale_colour_gradient(
    low = "blue",
    high = "red"
  ) +
  theme_minimal(base_size = 14) +
  labs(
    title = "SA vs SEA counts over time",
    x = "Counts in South Asia",
    y = "Counts in Southeast Asia",
    colour = "Year"
  )

# interaction plot

ggplot(data, aes(x = Period, y = No, colour = Region, group = Region)) +
  stat_summary(fun = mean, geom = "point", size = 3) +
  stat_summary(fun = mean, geom = "line", linewidth = 0.5) +
  stat_summary(
    fun.data = mean_se,
    geom = "errorbar",
    width = 0.1
  ) +
  theme_minimal(base_size = 14) +
  labs(
    title = "Changes in Himalayan Vulture counts before and after 2006",
    x = "Period",
    y = "Mean count",
    colour = "Region"
  )

