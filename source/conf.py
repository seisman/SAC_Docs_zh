#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# -- General configuration ------------------------------------------------

# If your documentation needs a minimal Sphinx version, state it here.
# needs_sphinx = '1.0'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ['sphinx.ext.todo',
    'sphinx.ext.mathjax',
    'sphinx.ext.ifconfig',
    'sphinx.ext.viewcode',
    'sphinx.ext.githubpages']

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

source_suffix = '.rst'

master_doc = 'index'

# General information about the project.
project = 'SAC参考手册'
copyright = '2012-2018, SeisMan'
author = 'SeisMan'
version = '4.0'
release = '4.0'
language = 'zh_CN'

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This patterns also effect to html_static_path and html_extra_path
exclude_patterns = []

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'

# If true, `todo` and `todoList` produce output, else they produce nothing.
todo_include_todos = True
numfig = True


# -- Options for HTML output ----------------------------------------------
import sphinx_rtd_theme
html_theme = 'sphinx_rtd_theme'
html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]
html_static_path = ['_static']
# html_theme_options = {}
html_context = {
    'display_github': True,
    'github_user': 'seisman',
    'github_repo': 'SAC_Docs_zh',
    'github_version': 'sphinx',
    'conf_py_path': '/source/',
}


# -- Options for LaTeX output ---------------------------------------------
latex_engine = "xelatex"
latex_documents = [
    (master_doc, 'SAC_Docs.tex', project, author, 'SAC_style'),
]
latex_additional_files = ['SAC_style.cls']
latex_elements = {
    'papersize'     : 'a4paper',
    'utf8extra'     : '',
    'inputenc'      : '',
    'cmappkg'       : '',
    'fontenc'       : '',
    'releasename'   : '',
    'babel'         : '',
    'figure_align'  : 'htb',
    'fontpkg'       : '',
    'fncychap'      : '',
    'preamble'      : '',
}


# -- Options for Epub output ----------------------------------------------

# Bibliographic Dublin Core info.
epub_title = project
epub_author = author
epub_publisher = author
epub_copyright = copyright
epub_exclude_files = ['search.html']
