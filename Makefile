SHELL := /bin/bash

build:	clean
	python -m build


clean:
	rm -rf build/
	rm -rf dist/
	rm -rf src/feiertage.egg-info/
	rm -rf venv/

upload: build
	twine upload dist/*

venv:	build
	python -m venv venv/
	. venv/bin/activate; pip install dist/feiertage*.tar.gz
	. venv/bin/activate; pip install ptpython
