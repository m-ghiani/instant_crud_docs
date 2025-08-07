# Configuration file for the Sphinx documentation builder.
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------

project = "instant_crud"
copyright = "2025, Massimo Ghiani"
author = "Massimo Ghiani"
release = "0.2.0"
language = 'en'
html_title = 'instant_crud documentation'
# -- General configuration ---------------------------------------------------

extensions = [
    "myst_parser",  # Enables Markdown via MyST
]

# Support both .rst and .md files
source_suffix = {
    ".rst": "restructuredtext",
    ".md": "markdown",
}

templates_path = ["_templates"]
exclude_patterns = []

# Optional: add the src directory to sys.path for autodoc if needed later
import os
import sys


# -- Options for HTML output -------------------------------------------------

html_theme = "sphinx_rtd_theme"  # Changed from 'alabaster' to ReadTheDocs theme
html_static_path = ["_static"]
