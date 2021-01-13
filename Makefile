MAKEFLAGS += --silent

.PHONY: clean-docs
clean-docs:
	find . -type f -name 'docs.json' -exec rm {} \;

.PHONY: clean-package
clean-package:
	find . -type f -name '*.zip' -exec rm {} \;

.PHONY: clean
clean: clean-docs clean-package

.PHONY: docs
docs: clean-docs
	./hack/generate-docs.sh

.PHONY: lint
lint:
	docker run -it --rm \
		-v $$(pwd):/usr/src/app/spoons \
		-w /usr/src/app/spoons \
		ghcr.io/alexashley/spoons/dev-tools:latest luacheck *.spoon

.PHONY: package
package: clean-package
	./hack/package-spoons.sh

.PHONY: release
release:
	./hack/github-release.sh
