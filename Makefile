# Must have `sentry-cli` installed globally
# Following variable must be passed in
#  SENTRY_AUTH_TOKEN
PREFIX=dist/heyhi
SENTRY_CLI=./node_modules/.bin/sentry-cli
VERSION=`$(SENTRY_CLI) releases propose-version`

setup_release: create_release upload_sourcemaps

create_release:
	$(SENTRY_CLI) releases new $(VERSION)

upload_sourcemaps:
	$(SENTRY_CLI) releases files \
		$(VERSION) upload-sourcemaps --url-prefix "~/" --rewrite --validate $(PREFIX)

create_env:
	@echo "version=${VERSION}" > .env
