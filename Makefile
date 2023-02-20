# .PHONY: clean

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
pwd := $(dir $(mkfile_path))
CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)

build: clean
	# hugo --gc --minify
	docker run --user ${CURRENT_UID} --rm -it -v $(pwd):/src:Z klakegg/hugo:ext-alpine --gc --minify
	mv public docs

clean:
	rm -rf docs resources/_gen
