# IQ INI PARSER

IQ is a parser for INI format, used by example by GIT (in `.git/config`).

# Features

- setting a field in ini, by e.g.: `iq -E file.ini section/key=value` 
  for writing only existing keys or
  `iq -I file.ini section/key=value`,for also adding new keys,
- displaying INI contents with syntax highlighting (by `iq -C file.ini`)
- fetching a given key value (by `iq -G file.ini main/example`)

# Usage

```zsh
iq {-C,-E,-G,-I} ini-file-path [-q,-v,-b,-h] SECT/ITEM=VALUE …
```