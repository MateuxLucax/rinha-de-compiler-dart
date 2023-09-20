# Base build image for Dart.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code.
COPY . .

# Run static analysis.
RUN dart analyze

# Run tests.
RUN dart test

# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline
RUN dart compile exe bin/rinha_de_compiler_dart.dart -o bin/rinha_de_compiler_dart

# Build minimal serving image from AOT-compiled `/rinha_de_compiler_dart` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/rinha_de_compiler_dart /app/bin/

# Run the compiled binary.
ENTRYPOINT ["rinha_de_compiler_dart"]