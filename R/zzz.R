# Package hooks for startup/load events

#' @keywords internal
.onLoad <- function(libname, pkgname) {
  font_dir <- system.file("fonts", package = "insperplot")
  if (!nzchar(font_dir)) return()

  existing <- unique(c(
    systemfonts::system_fonts()$family,
    systemfonts::registry_fonts()$family
  ))

  if (!"Inter" %in% existing) {
    systemfonts::register_font(
      name = "Inter",
      plain = file.path(font_dir, "inter", "Inter-Regular.ttf"),
      bold = file.path(font_dir, "inter", "Inter-Bold.ttf"),
      italic = file.path(font_dir, "inter", "Inter-Italic.ttf"),
      bolditalic = file.path(font_dir, "inter", "Inter-BoldItalic.ttf")
    )
  }

  if (!"EB Garamond" %in% existing) {
    systemfonts::register_font(
      name = "EB Garamond",
      plain = file.path(font_dir, "eb-garamond", "EBGaramond-Regular.ttf"),
      bold = file.path(font_dir, "eb-garamond", "EBGaramond-Bold.ttf"),
      italic = file.path(font_dir, "eb-garamond", "EBGaramond-Italic.ttf"),
      bolditalic = file.path(font_dir, "eb-garamond", "EBGaramond-BoldItalic.ttf")
    )
  }

  if (!"Playfair Display" %in% existing) {
    systemfonts::register_font(
      name = "Playfair Display",
      plain = file.path(font_dir, "playfair-display", "PlayfairDisplay-Regular.ttf"),
      bold = file.path(font_dir, "playfair-display", "PlayfairDisplay-Bold.ttf"),
      italic = file.path(font_dir, "playfair-display", "PlayfairDisplay-Italic.ttf"),
      bolditalic = file.path(font_dir, "playfair-display", "PlayfairDisplay-BoldItalic.ttf")
    )
  }
}
