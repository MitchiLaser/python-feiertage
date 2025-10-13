# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

import os
import sys
sys.path.insert(0, os.path.abspath('../../src/'))


# -- Project information ------------------------------------------------------
from datetime import datetime
import tomllib
with open("../../pyproject.toml", "rb") as f:
    toml = tomllib.load(f)

pyproject = toml["project"]

project = pyproject['name']
author = ', '.join([i['name'] for i in pyproject['authors']])
release = pyproject["version"]

year = datetime.now().year
if year > 2023:
    copyright = f'2023-{year} {author}'
else:
    copyright = f'2023, {author}'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ['sphinx.ext.napoleon',    # enable numpy docstrings
              'sphinx.ext.autodoc',
              'sphinx.ext.autosummary',
              'sphinx.ext.autosectionlabel']

templates_path = ['_templates']
exclude_patterns = []



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
