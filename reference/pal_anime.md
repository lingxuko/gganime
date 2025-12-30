# Anime discrete palette

Returns a palette function (like ggsci) that generates `n` colors.

## Usage

``` r
pal_anime(palette = "Asoul", alpha = 1, reverse = FALSE)
```

## Arguments

- palette:

  Palette name. See [`gganime_palettes`](gganime_palettes.md).

- alpha:

  Alpha transparency.

- reverse:

  Logical; whether to reverse the palette order.

## Value

A function with signature `function(n)` returning `n` hex colors.
