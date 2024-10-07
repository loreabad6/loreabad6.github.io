dir.create('docs/slides')
lapply(
  list.files("slides", full.names = TRUE),
  file.copy, "docs/slides", recursive=TRUE
)
