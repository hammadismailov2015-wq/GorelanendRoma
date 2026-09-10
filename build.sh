#!/bin/sh
# Собирает src/game.html (тело страницы) в самостоятельный index.html.
set -e
{
  printf '%s\n' '<!doctype html>' '<html lang="ru">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1">' \
    '<meta name="description" content="Игра по рассказу «Горелан и Рома»: восемь глав, арена, пустыня и погоня.">' \
    '<style>html{color-scheme:dark}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>' \
    '</head>' '<body>'
  cat src/game.html
  printf '%s\n' '</body>' '</html>'
} > index.html
echo "index.html собран: $(wc -c < index.html) байт"
