
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gganime

A lightweight, **ggsci-style** R package providing **built-in discrete
palettes** inspired by anime/illustration aesthetics, with drop-in
`ggplot2` scales.

<!-- badges: start -->

[![R-CMD-check](https://github.com/lingxuko/gganime/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lingxuko/gganime/actions/workflows/R-CMD-check.yaml)
[![pkgdown](https://github.com/lingxuko/gganime/actions/workflows/pkgdown.yaml/badge.svg)](https://github.com/lingxuko/gganime/actions/workflows/pkgdown.yaml)
<!-- badges: end -->

## Features

- Built-in discrete palettes (named palette registry)
- `ggplot2` scales: `scale_color_anime()` and `scale_fill_anime()`
- Palette utility functions:
  - `anime_palettes()` list available palettes
  - `pal_anime()` returns a palette function (`function(n)`) in **ggsci
    style**
  - `show_anime()` previews palettes with palette name and HEX codes

## Installation

Install the development version from GitHub:

``` r
# install.packages("remotes")
remotes::install_github("lingxuko/gganime")
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo lingxuko/gganime@HEAD
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#> * checking for file ‘/private/var/folders/g2/cfx6ss8522vc6pth53lkh_wr0000gn/T/RtmpE5xFWF/remotesa0914ba3f81a/lingxuko-gganime-ca12275/DESCRIPTION’ ... OK
#> * preparing ‘gganime’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘gganime_0.0.0.9000.tar.gz’
#> Installing package into '/private/var/folders/g2/cfx6ss8522vc6pth53lkh_wr0000gn/T/Rtmpt1udRn/temp_libpath9d566ef8e0cc'
#> (as 'lib' is unspecified)
```

## Example

Preview a palette:

``` r
library(gganime)
gganime_palettes()
#> [1] "Asoul"  "Diana"  "Bella"  "Eileen" "Ava"    "Carol"  "Mygo"   "Mujica"
#> [9] "Bocchi"
show_anime("Asoul")
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r
show_anime("Bocchi")
```

<img src="man/figures/README-example-2.png" width="100%" />

Use with ggplot2:

``` r
library(ggplot2)
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

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />
