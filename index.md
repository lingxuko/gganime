# gganime-An R Package Inspired by A-SOUL!

**“我的嘉心糖都是很厉害的人”——嘉然(Diana)**

![](reference/figures/Diana.jpg)

A lightweight R package providing **built-in discrete palettes** based
on the representative colors of **A-SOUL**, with drop-in `ggplot2`
scales. The package also contains palettes of **It’s Mygo**, **Ave
Mujica**, and **Bocchi the Rock!**.

## Features

- Built-in discrete palettes (named palette registry)
- `ggplot2` scales:
  [`scale_color_anime()`](reference/scale_color_anime.md) and
  [`scale_fill_anime()`](reference/scale_fill_anime.md)
- Palette utility functions:
  - `anime_palettes()` list available palettes
  - [`pal_anime()`](reference/pal_anime.md) returns a palette function
    (`function(n)`) in **ggsci style**
  - [`show_anime()`](reference/show_anime.md) previews palettes with
    palette name and HEX codes

## Installation

Install the development version from GitHub:

``` r
# install.packages("remotes")
remotes::install_github("lingxuko/gganime")
#> Using GitHub PAT from the git credential store.
#> Skipping install of 'gganime' from a github remote, the SHA1 (b00919e8) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Palette Preview

``` r
library(gganime)
gganime_palettes()
#> [1] "Asoul"  "Diana"  "Bella"  "Eileen" "Ava"    "Carol"  "Mygo"   "Mujica"
#> [9] "Bocchi"
```

## **A-SOUL** Palette:

[Wiki of A-SOUL](https://virtualyoutuber.fandom.com/wiki/A-SOUL)

![](reference/figures/Diana2.jpg)![](reference/figures/Bella.jpg)![](reference/figures/Eileen.jpg)![](reference/figures/Ava.jpg)![](reference/figures/Carol.jpg)

``` r
# A-SOUL Palette Preview
show_anime("Asoul")
```

![](reference/figures/README-Asoul-1.png)

## **Bocchi the Rock!** Palette:

[Wiki of Bocchi the
Rock!](https://en.wikipedia.org/wiki/Bocchi_the_Rock!)

![](reference/figures/Bocchi.gif)![](reference/figures/Kita.gif)![](reference/figures/Yamada.gif)![](reference/figures/Ijichi.gif)

``` r
# Bocchi the Rock! Palette Preview
show_anime("Bocchi")
```

![](reference/figures/README-Bocchi-1.png)

## **It’s Mygo** Palette:

``` r
show_anime("Mygo")
```

![](reference/figures/README-Mygo-1.png)

Use with ggplot2:

``` r
library(ggplot2)
#> Warning: package 'ggplot2' was built under R version 4.4.3
library(gganime)

set.seed(1)
df <- data.frame(
  x = rnorm(200),
  grp = factor(sample(paste0("G", 1:5), 200, replace = TRUE),
               levels = paste0("G", 1:5))
)

grp_effect <- setNames(c(-1.0, -0.4, 0.0, 0.5, 1.2), paste0("G", 1:5))
df$y <- 0.7 * df$x + grp_effect[as.character(df$grp)] + rnorm(200, sd = 0.6)

ggplot(df, aes(x, y, color = grp)) +
  geom_point(size = 2, alpha = 0.9) +
  scale_color_anime(palette = "Asoul") +
  theme_minimal(base_size = 12)
```

![](reference/figures/README-unnamed-chunk-3-1.png)
