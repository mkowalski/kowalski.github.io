# .PHONY: clean

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
pwd := $(dir $(mkfile_path))

build: clean
	# hugo --gc --minify
	docker run --rm -it -v $(pwd):/src:Z klakegg/hugo:ext-alpine --gc --minify
	mv public docs

clean:
	rm -rf docs resources/_gen
