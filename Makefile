clean:
	@for trash in voodoo-drc.txt fp-info-cache *-bak; do\
		if [ -f $$trash ] || [ -d $$trash ]; then \
			echo "Removing $$trash" ;\
			rm -rf $$trash ;\
		fi ; \
	done

python:
	@python3 -m venv _build
	( \
		. _build/bin/activate; \
		_build/bin/python -m pip install --upgrade pip; \
        _build/bin/python -m pip install tox; \
		_build/bin/python -m pip install -r requirements.txt --no-warn-script-location; \
	)
