# Base build image for Dart.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /
COPY pubspec.* ./
RUN dart pub get

# Copy app source code.
COPY . .

# Build an AOT-compiled snapshot of the app.
RUN dart compile exe bin/dartify_rinha.dart -o bin/dartify_rinha

# Build minimal serving image from AOT-compiled `/dartify_rinha` and required system
FROM scratch

LABEL maintainer="Mateus Lucas Cruz Brandt <mateuxlucax@gmail.com>"

# Copy the AOT-compiled snapshot from the build stage.
COPY --from=build /bin/dartify_rinha /bin/dartify_rinha

# Make available to the world outside this container.
ENTRYPOINT ["dartify_rinha"]
