library(ggplot2)
library(readr)

df <- read_csv("../data/penglings.csv", show_col_types = FALSE)

# convert columns  filer out  the NA rows
df$bill_length_mm <- as.numeric(df$bill_length_mm)
df$flipper_length_mm <- as.numeric(df$flipper_length_mm)
df$body_mass_g <- as.numeric(df$body_mass_g)

df <- df[!is.na(df$bill_length_mm) &
         !is.na(df$flipper_length_mm) &
         !is.na(df$body_mass_g), ]
# create ggplost
p <- ggplot(df, aes(
  x = flipper_length_mm,
  y = body_mass_g,
  color = species,
  size = bill_length_mm
)) +
  geom_point(alpha = 0.8) + # semi-transparent points
  labs(
    title = "Penguins (ggplot2)",
    x = "Flipper Length (mm)", # x-axis label
    y = "Body Mass (g)"
  ) +
  theme_minimal()

print(p)

ggsave("../img/ggplot2.png", p, width = 9, height = 5)
