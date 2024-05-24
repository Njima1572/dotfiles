## カスタム辞書の登録

### fcitx5-skkの読み込む場所

- `~/.local/share/fcitx5/skk/dictionary_list` を参照して、辞書を登録する。

カスタム辞書を独立して読ませる方法が分かってないので、SKK-JISYO.Lとmergeして読ませている。

1. `nkf -w -Lu SKK-JISYO.L > SKK-JISYO.L.utf8`
2. `skkdic-expr2 SKK-JISYO.L.utf8 custom-dict.utf8 > SKK-JISYO.L+custom.utf8`
3. 
```
;; -*- mode: fundamental; coding: utf-8 -*-
```
の一行を`SKK-JISYO.L+custom.utf8`の一番上に追加

4. `~/local/share/fcitx5/skk/dictionary_list` に 
```
type=file,file=/path/to/custom/dict/SKK-JISYO.L+custom.utf8,mode=readonly
```
5. `fcitx5 -r -d` daemonでfcitx5の再起動
