#!/bin/sh
# Собирает исходники (тело страницы) в самостоятельные HTML-файлы.
set -e
wrap() {           # wrap <исходник> <результат> <описание>
  {
    printf '%s\n' '<!doctype html>' '<html lang="ru">' '<head>' \
      '<meta charset="utf-8">' \
      '<meta name="viewport" content="width=device-width, initial-scale=1">' \
      "<meta name=\"description\" content=\"$3\">" \
      '<style>html{color-scheme:dark}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>' \
      '</head>' '<body>'
    cat "$1"
    printf '%s\n' '</body>' '</html>'
  } > "$2"
  echo "$2 собран: $(wc -c < "$2") байт"
}
wrap src/game.html   index.html "Игра по рассказу «Горелан и Рома»: восемь глав, арена, пустыня и погоня."
wrap src/forest.html les.html   "Игра по рассказу «Приключения Омешкина, Ромомэо и Пельмешкина в лесу»: шесть глав."
