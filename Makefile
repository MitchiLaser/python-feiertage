SHELL := /bin/bash

.SILENT: clean
.IGNORE: clean

build:	clean
	python -m build


clean:
	rm -rf build/
	rm -rf dist/
	rm -rf src/feiertage_de.egg-info/
	rm -rf venv/
	rm -rf `find . -type d -name __pycache__`
	cd docs && $(MAKE) clean

upload: build
	twine upload dist/*

venv:	build
	python -m venv venv/
	. venv/bin/activate; pip install dist/feiertage*.tar.gz
	. venv/bin/activate; pip install ptpython
