## rendering naar een of meerdere van de onderstaande formats

# rm(list = ls())

require(rmarkdown)
require(tufte)
require(bookdown)

# # convert refs to nicer format 
# require(RefManageR)
# refs <- RefManageR::ReadBib("bibliography/MyBibliography.bib")
# RefManageR::WriteBib(refs, file = "bibliography/MyModifiedBibliography", biblatex = T)

# gitbook formatted html pages
# file.remove("_main.md") # only when requested

bookdown::render_book("index.Rmd", output_format = bookdown::gitbook(split_by = "chapter"), new_session = T, clean_envir = T)

# tufte style html pages (accepts no more than 2-level sections)
bookdown::render_book("index.Rmd", output_format = bookdown::tufte_html_book(split_by = "chapter"),
                      output_dir = "tufte_book", new_session = T, clean_envir = T)

# "normal" pdf
# options(tinytex.verbose = TRUE) # change to TRUE for debugging
bookdown::render_book("index.Rmd", output_format = bookdown::pdf_book(latex_engine = "xelatex"), new_session = T, clean_envir = T)

file.remove("_main.md") # only when requested

# Deltares report
options(tinytex.verbose = TRUE) # change to TRUE for debugging
bookdown::render_book("index.Rmd", output_format = bookdown::pdf_book(template = "deltares-report-template.tex"), new_session = T, clean_envir = T)


# tufte pdf (accepts no more than 2-level sections)
bookdown::render_book("index.Rmd", output_format = bookdown::tufte_book2(),
                      output_dir = "tufte_book", new_session = T, clean_envir = T)


# Veel gemaakte fouten
# Figuurlabels (label in code block) mogen geen underscore (_) bevatten bij rendering naar pdf
# Dubbele labels mogen niet (door hele document, alle hoofdstukken)
# Tufte output laat maar 2 niveau's toe (chapters # en sections ##)
# 