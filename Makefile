# Must have `sentry-cli` installed globally
# Following variable must be passed in
#  SENTRY_AUTH_TOKEN
PREFIX=dist
SENTRY_CLI=./node_modules/.bin/sentry-cli
VERSION=`$(SENTRY_CLI) releases new sentryTest@0.0.1`

# setup_release:
# 	echo "TODO: <PLACEHOLDER>"

setup_release: create_release upload_sourcemaps

create_release:
	$(SENTRY_CLI) releases new $(VERSION)

upload_sourcemaps:
	$(SENTRY_CLI) releases files \
		$(VERSION) upload-sourcemaps --rewrite --validate $(PREFIX)

create_env:
	@echo "version=${VERSION}" > .env
