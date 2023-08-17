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

devenv:	
	python -m venv venv/
	. venv/bin/activate; pip install -e .
	. venv/bin/activate; pip install ptpython

docs:	build
	cd docs && $(MAKE) html
