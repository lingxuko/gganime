#' Show a palette
#'
#' @param palette Palette name.
#' @param n Number of colors to show. Defaults to the palette max.
#' @export
show_anime <- function(palette = "Asoul", n = NULL) {
  cols <- .gganime_palettes[[palette]]
  if (is.null(cols)) {
    stop("Unknown palette: ", palette, call. = FALSE)
  }
  if (is.null(n)) n <- length(cols)
  cols <- pal_anime(palette = palette)(n)

  op <- graphics::par(mar = c(1, 1, 2.5, 1))
  on.exit(graphics::par(op), add = TRUE)

  graphics::plot.new()
  graphics::plot.window(xlim = c(0, n), ylim = c(0, 1.18))

  graphics::text(x = n / 2, y = 1.12, labels = palette, cex = 1.1, font = 2)

  for (i in seq_len(n)) {
    graphics::rect(i - 1, 0, i, 1, col = cols[i], border = NA)
    graphics::text(x = i - 0.5, y = 0.5, labels = cols[i], col = "black", cex = 0.85)
  }

  invisible(cols)
}
