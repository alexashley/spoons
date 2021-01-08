MAKEFLAGS += --silent

.PHONY: clean docs package

clean:
	find . -type f -name '*.zip' -exec rm {} \;
	find . -type f -name 'docs.json' -exec rm {} \;

docs: clean
	./hack/generate-docs.sh

package: clean
	./hack/package-spoons.sh
