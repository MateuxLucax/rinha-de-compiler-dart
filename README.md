<div align="center">

![banner]

</div>

# Introdução

Este é um projeto desenvolvido utilizando Dart para realizar a interpretação de código Rinha da [Rinha de Compiler](https://github.com/aripiprazole/rinha-de-compiler). Foi implementado utilizando um Tree-Walking Interpreter com Pattern Matching do Dart 3.

## Como executar

### Dart

Para executar utilzando Dart, basta instalar basta acessar a [documentação oficial](https://dart.dev/get-dart) e seguir os passos de instalação.

Após instalado basta executar:

```bash
dart run bin/dartify_rinha.dart <*.rinha.json>
```

#### Testes

Caso queira executar os testes automatizados, execute:

```bash
dart test
```

#### Build

Para realizar o build de Dart para um excutável auto-contido, basta executar o comando:

```bash
dart compile exe bin/dartify_rinha.dart -o build/dartify_rinha
```

E após basta executar:

```bash
build/dartify_rinha <*.rinha.json>
```

## Para a Rinha

Caso queira testar a rinha utilizando Dockerhub, você pode utilizar a image `mateuxlucax/dartify_rinha` utilizando o comando:

```bash
docker run --name dartify_rinha -v <*.rinha.json>:/var/rinha/source.rinha.json --memory=2gb --cpus=0.25 mateuxlucax/dartify_rinha:latest
```

Para fazer o build você mesmo, basta executar o comando:

```bash
docker build -t dartify_rinha .
```

E então executar:

```bash
docker run -it --rm --name dartify_rinha -v <*.rinha.json>:/var/rinha/source.rinha.json --memory=2gb --cpus=0.25 dartify_rinha:latest
```

[banner]: ./assets/banner.png
