#' Internal labels for palettes
#' @keywords internal
.gganime_labels <- list(
  Asoul  = c("Diana", "Bella", "Eileen", "Ava", "Carol"),
  Bocchi = c("Bocchi", "Kita", "Yamada", "Ijichi" )
)

#' Show a palette
#'
#' Title: "Palette of <palette>"
#' Each color block shows: "<label>#RRGGBB" centered in the block
#'
#' @param palette Palette name.
#' @param n Number of colors to show. Defaults to the palette max.
#' @param reverse Reverse palette order.
#' @param alpha Alpha transparency
#' @export
show_anime <- function(palette = "Asoul", n = NULL, reverse = FALSE, alpha = 1) {
  cols0 <- .gganime_palettes[[palette]]
  if (is.null(cols0)) {
    stop("Unknown palette: ", palette, call. = FALSE)
  }

  if (is.null(n)) n <- length(cols0)
  n <- as.integer(n)
  if (n <= 0) stop("n must be a positive integer.", call. = FALSE)
  if (n > length(cols0)) {
    stop("Palette '", palette, "' has max ", length(cols0),
         " colors; requested n = ", n, ".", call. = FALSE)
  }

  if (!is.numeric(alpha) || length(alpha) != 1 || alpha < 0 || alpha > 1) {
    stop("alpha must be a single number in [0, 1].", call. = FALSE)
  }

  # Use raw palette hex (avoid printing #RRGGBBAA)
  cols_raw <- cols0[seq_len(n)]
  if (isTRUE(reverse)) cols_raw <- rev(cols_raw)

  # Fill colors with alpha applied (display only)
  cols_fill <- grDevices::adjustcolor(cols_raw, alpha.f = alpha)

  # Printed hex: force #RRGGBB (drop any alpha suffix like FF)
  cols_print <- toupper(substr(cols_raw, 1, 7))

  # Labels for this palette
  labs <- .gganime_labels[[palette]]
  if (is.null(labs)) {
    labs <- rep("", n)
  } else {
    labs <- labs[seq_len(min(length(labs), n))]
    if (length(labs) < n) labs <- c(labs, rep("", n - length(labs)))
    if (isTRUE(reverse)) labs <- rev(labs)
  }

  # Plot: reduce top margin
  op <- graphics::par(mar = c(1, 1, 2.6, 1))
  on.exit(graphics::par(op), add = TRUE)

  graphics::plot.new()
  graphics::plot.window(xlim = c(0, n), ylim = c(0, 1.10))

  # Title lower (closer to blocks)
  graphics::text(
    x = n / 2, y = 1.04,
    labels = paste0("Palette of ", palette),
    cex = 1.35, font = 2
  )

  # Blocks + centered label (bigger)
  for (i in seq_len(n)) {
    graphics::rect(i - 1, 0, i, 1, col = cols_fill[i], border = NA)

    graphics::text(
      x = i - 0.5, y = 0.5,  # center of block
      labels = paste0(labs[i], "\n", cols_print[i]),
      col = "black",
      cex = 1.05,            # label font size
      font = 2               # bold for readability
    )
  }

  invisible(cols_raw)
}
