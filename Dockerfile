# Base build image for Dart.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code.
COPY . .

# Build an AOT-compiled snapshot of the app.
RUN dart compile exe bin/dartify_rinha.dart -o bin/dartify_rinha

# Build minimal serving image from AOT-compiled `/dartify_rinha` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM scratch AS runtime
COPY --from=build /runtime/ /
COPY --from=build /app/bin/dartify_rinha /app/bin/

# Run the compiled binary.
ENTRYPOINT ["dartify_rinha"]