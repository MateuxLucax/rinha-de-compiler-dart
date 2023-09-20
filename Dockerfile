# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.12)
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code and AOT compile it.
COPY . .
# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline
RUN dart compile exe bin/dartify_rinha.dart -o bin/dartify_rinha

# Build minimal serving image from AOT-compiled `/dartify_rinha` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/dartify_rinha /app/bin/

LABEL maintainer="Mateus Lucas Cruz Brandt <mateuxlucax@gmail.com>"

# Start dartify_rinha.
CMD ["/app/bin/dartify_rinha"]
