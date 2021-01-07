MAKEFLAGS += --silent

.PHONY: clean doc package

clean:
	find . -type f -name '*.zip' -exec rm {} \;
	find . -type f -name 'docs.json' -exec rm {} \;

doc:
	./hack/generate-docs.sh

package: clean
	./hack/package-spoons.sh
