clean:
	flutter clean

pub-get:
	flutter pub get

gen:
	dart run build_runner build --delete-conflicting-outputs

gen-watch:
	dart run build_runner watch --delete-conflicting-outputs

format:
	dart format --line-length=120 .

run:
	flutter run --dart-define-from-file=config.json

run-release:
	flutter run --dart-define-from-file=config.json --release

run-profile:
	flutter run --dart-define-from-file=config.json --profile

build-web:
	flutter build web --release --dart-define-from-file=config.json

build-apk:
	flutter build apk --dart-define-from-file=config.json

build-ipa:
	flutter build ipa --dart-define-from-file=config.json

build-apk-test:
	flutter build apk --dart-define-from-file=config-client-test.json

build-ipa-test:
	flutter build ipa --dart-define-from-file=config-client-test.json

build-apk-stage:
	flutter build apk --dart-define-from-file=config-stage.json

build-ipa-stage:
	flutter build ipa --dart-define-from-file=config-stage.json

setup: clean pub-get gen format