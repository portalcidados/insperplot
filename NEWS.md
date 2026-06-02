# insperplot 0.1.0

* Initial CRAN release.
* Custom ggplot2 theme: `theme_insper()` with configurable fonts, grid lines,
  borders, and title alignment.
* Bundled fonts: Inter, EB Garamond, and Playfair Display are shipped with
  the package and registered automatically on load via `systemfonts` — no
  manual download or setup required.
* Color palettes based on Insper's brand identity: sequential, diverging, and
  qualitative palettes accessible via `insper_palette()` and
  `show_insper_palettes()`.
* Discrete and continuous ggplot2 scales: `scale_color_insper_d()`,
  `scale_color_insper_c()`, `scale_fill_insper_d()`, `scale_fill_insper_c()`.
* High-level plot functions: `insper_timeseries()`, `insper_barplot()`,
  `insper_scatterplot()`, `insper_area()`, `insper_boxplot()`,
  `insper_violin()`, `insper_histogram()`, `insper_density()`,
  `insper_heatmap()`.
* Utility functions: `save_insper_plot()`, `format_num_br()`.
* Six bundled datasets for examples: `fossil_fuel`, `macro_series`,
  `macro_series_long`, `rec_buslines`, `rec_passengers`, `spo_metro`.
