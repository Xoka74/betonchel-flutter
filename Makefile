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

build-web-production:
	flutter build web --release --dart-define-from-file=config-production.json

setup: clean pub-get gen format