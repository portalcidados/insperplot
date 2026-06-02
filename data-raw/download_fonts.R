# Download bundled font files from Google Fonts
#
# This script documents how the font files in inst/fonts/ were obtained.
# Run it to refresh or update the bundled fonts.
#
# All three fonts are licensed under the SIL Open Font License 1.1.
# See inst/fonts/OFL.txt for the full license text.

library(systemfonts)

pkg_dir <- here::here()
font_dir <- file.path(pkg_dir, "inst", "fonts")

dir.create(file.path(font_dir, "inter"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path(font_dir, "eb-garamond"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path(font_dir, "playfair-display"), showWarnings = FALSE, recursive = TRUE)

tmpdir <- tempdir()

# Download from Google Fonts ----
message("Downloading Inter...")
get_from_google_fonts("Inter", dir = file.path(tmpdir, "inter"))

message("Downloading EB Garamond...")
get_from_google_fonts("EB Garamond", dir = file.path(tmpdir, "ebgaramond"))

message("Downloading Playfair Display...")
get_from_google_fonts("Playfair Display", dir = file.path(tmpdir, "playfair"))

# Copy only the weights we need (Regular, Bold, Italic, BoldItalic) ----

# Inter (sans-serif, body text)
file.copy(file.path(tmpdir, "inter", "Inter-regular.ttf"),
          file.path(font_dir, "inter", "Inter-Regular.ttf"), overwrite = TRUE)
file.copy(file.path(tmpdir, "inter", "Inter-700.ttf"),
          file.path(font_dir, "inter", "Inter-Bold.ttf"), overwrite = TRUE)
file.copy(file.path(tmpdir, "inter", "Inter-italic.ttf"),
          file.path(font_dir, "inter", "Inter-Italic.ttf"), overwrite = TRUE)
file.copy(file.path(tmpdir, "inter", "Inter-700italic.ttf"),
          file.path(font_dir, "inter", "Inter-BoldItalic.ttf"), overwrite = TRUE)

# EB Garamond (serif, title fallback)
file.copy(file.path(tmpdir, "ebgaramond", "EB Garamond-regular.ttf"),
          file.path(font_dir, "eb-garamond", "EBGaramond-Regular.ttf"), overwrite = TRUE)
file.copy(file.path(tmpdir, "ebgaramond", "EB Garamond-700.ttf"),
          file.path(font_dir, "eb-garamond", "EBGaramond-Bold.ttf"), overwrite = TRUE)
file.copy(file.path(tmpdir, "ebgaramond", "EB Garamond-italic.ttf"),
          file.path(font_dir, "eb-garamond", "EBGaramond-Italic.ttf"), overwrite = TRUE)
file.copy(file.path(tmpdir, "ebgaramond", "EB Garamond-700italic.ttf"),
          file.path(font_dir, "eb-garamond", "EBGaramond-BoldItalic.ttf"), overwrite = TRUE)

# Playfair Display (serif, title fallback)
file.copy(file.path(tmpdir, "playfair", "Playfair Display-regular.ttf"),
          file.path(font_dir, "playfair-display", "PlayfairDisplay-Regular.ttf"), overwrite = TRUE)
file.copy(file.path(tmpdir, "playfair", "Playfair Display-700.ttf"),
          file.path(font_dir, "playfair-display", "PlayfairDisplay-Bold.ttf"), overwrite = TRUE)
file.copy(file.path(tmpdir, "playfair", "Playfair Display-italic.ttf"),
          file.path(font_dir, "playfair-display", "PlayfairDisplay-Italic.ttf"), overwrite = TRUE)
file.copy(file.path(tmpdir, "playfair", "Playfair Display-700italic.ttf"),
          file.path(font_dir, "playfair-display", "PlayfairDisplay-BoldItalic.ttf"), overwrite = TRUE)

# Report ----
files <- list.files(font_dir, pattern = "\\.ttf$", recursive = TRUE, full.names = TRUE)
sizes <- file.info(files)$size
for (i in seq_along(files)) {
  message(sprintf("  %s  (%s KB)", basename(files[i]), round(sizes[i] / 1024)))
}
message(sprintf("\nTotal: %s KB (%s files)", round(sum(sizes) / 1024), length(files)))
