#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import datetime
sys.path.insert(0, os.path.abspath('_extensions'))

# -- General configuration ------------------------------------------------
extensions = ['sphinx.ext.todo',
    'sphinx.ext.mathjax',
    'sphinx.ext.ifconfig',
    'sphinx.ext.viewcode',
    'sphinx.ext.githubpages',
    'sphinx_cjkspace.cjkspace']

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

source_suffix = '.rst'

master_doc = 'index'

# General information about the project.
project = 'SAC参考手册'
copyright = '2012 - {}, SeisMan'.format(datetime.date.today().year)
author = 'SeisMan'
version = '4.0'
release = version
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
html_static_path = []
# html_theme_options = {}
html_context = {
    'display_github': True,
    'github_user': 'seisman',
    'github_repo': 'SAC_Docs_zh',
    'github_version': 'master',
    'conf_py_path': '/source/',
    'theme_vcs_pageview_mode': 'blob',
}


# -- Options for LaTeX output ---------------------------------------------
latex_engine = "xelatex"
latex_documents = [
    (master_doc, 'SAC_Docs.tex', project, author, 'ctexbook'),
]
latex_additional_files = ['SAC_style.sty', 'images/SAC_logo.pdf']
latex_elements = {
    'papersize' : 'a4paper',
    'pointsize' : '11pt',
    'extraclassoptions' : 'UTF8,twoside',
    'preamble'  : r'\input{SAC_style.sty}',
    'figure_align' : 'H',
    'geometry'  : r'\usepackage[top=3.0cm, bottom=2.0cm, left=3.5cm, right=2.5cm]{geometry}',
    # customized tableofcontents
    'tableofcontents' : r'''\frontmatter
                            \pdfbookmark[0]{\contentsname}{contents}
                            \tableofcontents
                            \cleardoublepage
                            \pdfbookmark[0]{\listfigurename}{lof}
                            \listoffigures
                            \cleardoublepage
                            \pdfbookmark[0]{\listtablename}{lot}
                            \listoftables
                            \mainmatter
                            \pagestyle{normal}''',
    'passoptionstopackages': r'\PassOptionsToPackage{dvipsnames, svgnames}{xcolor}',
    'sphinxsetup': r'''VerbatimColor={named}{Lavender},
                       VerbatimBorderColor={named}{Silver},
                       ''',
    'fncychap'  : '',   # use default chapter style from ctex
    'babel'     : '',
    'polyglossia': '',
    'fontpkg'   : '',
    'cmappkg'   : '',
    'fontenc'   : '',
}


# -- Options for Epub output ----------------------------------------------

# Bibliographic Dublin Core info.
epub_title = project
epub_author = author
epub_publisher = author
epub_copyright = copyright
epub_exclude_files = ['search.html']
