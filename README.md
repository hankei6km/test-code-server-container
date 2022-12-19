# test-code-server-container

VSCode の [Remote Tunels](https://code.visualstudio.com/docs/remote/tunnels) をコンテナで動かすテスト。

詳細: [VSCode の Remote Tunnels で「いつもの開発環境へ」お手軽リモート接続](https://zenn.dev/hankei6km/articles/connect-my-machine-via-vscode-remote-tunne)

## ビルド

```sh
$ docker build -t vscode-tunnel ./image_min
```

## コンテナ開始

```sh
$ mkdir vscode-cli vscode-server Documents
$ docker run -it -u vscode -v "${PWD}/vscode-cli:/home/vscode/.vscode-cli" \
    -v "${PWD}/vscode-server:/home/vscode/.vscode-server" \
    -v "${PWD}/Documents:/home/vscode/Documents" \
    --name vscode-tunnel --hostname vscode-tunnel vscode-tunnel:latest
```


## Dubs(Keyring)を有効化

`./image_dbus` は DBus と gnome-Keyring-daemono を有効化した状態のイメージを作成できる。

ただし、keyring のファイルは seahorse などでパスワードなし(暗号化しない)状態で作成してコピーする必要がある。

```sh
$ mkdir vscode-cli vscode-server Documents
$ mkdir keyrings # 別途作成してある `default` と `:.keyring` をコピーする
$ docker run -it -u vscode -v "${PWD}/vscode-cli:/home/vscode/.vscode-cli" \
    -v "${PWD}/vscode-server:/home/vscode/.vscode-server" \
    -v "${PWD}/Documents:/home/vscode/Documents" \
     -v "${PWD}/keyrings:/home/vscode/.local/share/keyrings \
    --name vscode-tunnel --hostname vscode-tunnel vscode-tunnel:latest
```
