#' Anime color scale (discrete)
#'
#' @param palette Palette name.
#' @param alpha Alpha transparency.
#' @param reverse Reverse palette order.
#' @param ... Passed to \code{ggplot2::discrete_scale()}.
#' @export
scale_color_anime <- function(palette = "Asoul", alpha = 1, reverse = FALSE, ...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = "anime",
    palette = pal_anime(palette = palette, alpha = alpha, reverse = reverse),
    ...
  )
}

#' Anime fill scale (discrete)
#'
#' @inheritParams scale_color_anime
#' @export
scale_fill_anime <- function(palette = "Asoul", alpha = 1, reverse = FALSE, ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = "anime",
    palette = pal_anime(palette = palette, alpha = alpha, reverse = reverse),
    ...
  )
}
