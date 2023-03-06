# Docker_python_arm_lambda_zip_use
## 概要
- armベースのpythonの実行環境を作成できるDocker_image。
- AWS Lambdaのzipデブロイ用として使用できる。

### Docker起動コマンド

```bash:
$docker-compose up --build
```

### lambdaのzipデブロイの基本手順コマンド

- lambda関数で実行したいpyファイルがある階層に必要なライブラリをpipでinstallする。
```bash:
#個別にinstall
$pip install --target ./packages requests

#requirements.txtを使用して一気にinstall
$pip install --target ./packages -r requirements.txt
```

- lambda関数で実行したいpyファイルにimportの検索ディレクトリとして`./packages`を追加する。
- これは、上記のpipでinstallしたライブラリのディレクトリ名にする。（packagesである必要はないということ）

```python:
import os
import sys
sys.path.append(os.path.join(os.path.dirname(__file__), './packages'))
```


- zipコマンドでライブラリごとzip化する
```bash:
$zip -r ../my-deployment-package.zip .
```

#### 参考資料
- [Docker + Python の実行環境を作ってみた](https://note.com/digiangler777/n/n1f575a8de92a)
- [python:3.9](https://hub.docker.com/layers/library/python/3.9/images/sha256-6e8eb4708e81141a9489a790a878621f8dd1196c790c9ab0d6ef80823f4c6314?context=explore)
- [.zip ファイルアーカイブで Python Lambda 関数をデプロイする](https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/python-package.html)
- [[AWS] Lambda 関数を AWS CLI を使ってデプロイする](https://qiita.com/ksh-fthr/items/dbf4875dbffde4fd5614)
- [Pythonでimportの対象ディレクトリのパスを確認・追加（sys.pathなど）](https://note.nkmk.me/python-import-module-search-path/)

