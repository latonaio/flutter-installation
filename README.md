# flutter-installation  

## 概要（AIONでのFlutterの位置づけ1）
LatonaおよびAIONでは、より先進的で安定的なエッジコンピューティング アプリ開発・運用環境を管理維持するために、Flutterを採用しています。
Flutterを用いて、エッジ環境でも気軽にアプリ開発運用をすることができます。

## UIフロントエンドリソースのコンテナ単位での運用とエッジコンテナオーケストレーション（AIONでのFlutterの位置づけ2）
AIONは、エッジ端末においてaion-coreとKubernetes Master Nodeを用いて、UIフロントエンドリソースをコンテナ化し、マイクロサービスとして、同様にコンテナライズされたui-backendや他のDB、API、マイクロサービス群と連携して省エネで
多様なアプリケーション体験を提供しています。  
Flutterで開発されたUIフロントエンドリソースは、クロスプラットフォームに最適なコンテナリソースとして、エッジコンピューティング環境としてのAION稼働環境下で先進的・機能的・安定的なアプリケーション運用維持を可能にします。

## Flutterについて
Flutterは、Googleにより提供されている、ネイティヴアプリ向けのクロスプラットフォームUIツールキットです。  

## （エッジ環境向け）開発環境用 Docker イメージの作成  
開発・ビルド環境用の Docker イメージを作成・利用できるスクリプトを用意しています。

### （エッジ環境向け）開発環境の準備  
`make launch` を実行すると、自動で Docker イメージがビルドされ、イメージ内の bash が起動します。この Docker イメージには、Flutter SDK がインストールされているため、そのまま開発やビルドが可能です。

### 開発環境の削除  
Docker イメージ更新時など、一時的にイメージ・コンテナを削除する場合は、`make delete` を実行してください。

※ この操作を実行すると、コンテナ内のデータがすべて削除されるのでご注意ください。

