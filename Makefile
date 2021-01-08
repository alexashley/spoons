MAKEFLAGS += --silent

.PHONY: clean docs lint package

clean:
	find . -type f -name '*.zip' -exec rm {} \;
	find . -type f -name 'docs.json' -exec rm {} \;

docs: clean
	./hack/generate-docs.sh

lint:
	docker run -it --rm \
		-v $$(pwd):/usr/src/app/spoons \
		-w /usr/src/app/spoons \
		ghcr.io/alexashley/spoons/dev-tools:latest luacheck *.spoon

package: clean
	./hack/package-spoons.sh
