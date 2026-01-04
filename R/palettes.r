#' Built-in palettes (internal registry)
#'
#' A named list of character vectors (hex colors).
#' @keywords internal
.gganime_palettes <- list(
  Asoul = c("#E69093", "#B6342E", "#FFF3E9", "#CACBF7", "#8876DA"),
  Diana = c("#BB8E7B", "#F0C6D2", "#D4708D", "#2F6B99", "#E69093", "#E7D0CA"),
  Bella = c("#625C88", "#E47164", "#474781", "#FAE9E1", "#B6342E", "#F4C7C2"),
  Eileen = c("#C2C4DA", "#F7DFC7", "#8E98C9", "#FFF3E9", "#C3CEE2", "#485884"),
  Ava = c("#CACBF7", "#92C3E3", "#6C51AC", "#D3E7F2", "#42478A", "#4085B0"),
  Carol = c("#E5DDF6", "#9566AC", "#B99FE8", "#2B244E", "#F4E6FF", "#8876DA"),
  Mygo = c("#E6E4E7", "#9E94A7", "#D0AA9B", "#FCCFE0", "#725F67"),
  Mujica = c("#E9EFE4", "#FDF5E0", "#6D6C67", "#C8D5E6", "#CEBED9"),
  Bocchi = c("#F4BAC6", "#DB725F", "#778FB6", "#F2DB8B"),
  Bocchi_8 = c("#E9608E", "#F8ABC1", "#E40647", "#DB725F", "#FABD03", "#F4DF87" ,"#0070BA","#778FB6")
)

#' List available animepal palettes
#'
#' @return A character vector of palette names.
#' @export
gganime_palettes <- function() {
  names(.gganime_palettes)
}

#' Anime discrete palette
#'
#' Returns a palette function (like ggsci) that generates \code{n} colors.
#'
#' @param palette Palette name. See \code{\link{gganime_palettes}}.
#' @param alpha Alpha transparency.
#' @param reverse Logical; whether to reverse the palette order.
#'
#' @return A function with signature \code{function(n)} returning \code{n} hex colors.
#' @export
pal_anime <- function(palette = "Asoul", alpha = 1, reverse = FALSE) {
  cols <- .gganime_palettes[[palette]]
  if (is.null(cols)) {
    stop("Unknown palette: ", palette,
         ". Available: ", paste(gganime_palettes(), collapse = ", "), call. = FALSE)
  }
  if (!is.numeric(alpha) || length(alpha) != 1 || alpha < 0 || alpha > 1) {
    stop("alpha must be a single number in [0, 1].", call. = FALSE)
  }
  if (isTRUE(reverse)) cols <- rev(cols)

  # apply alpha without importing scales as a hard dependency if you prefer:
  # here we use grDevices::adjustcolor (base R)
  cols <- grDevices::adjustcolor(cols, alpha.f = alpha)

  function(n) {
    if (!is.numeric(n) || length(n) != 1 || n <= 0) {
      stop("n must be a positive integer.", call. = FALSE)
    }
    n <- as.integer(n)
    if (n > length(cols)) {
      stop("Palette '", palette, "' has max ", length(cols),
           " colors; requested n = ", n, ".", call. = FALSE)
    }
    cols[seq_len(n)]
  }
}
