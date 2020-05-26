<!-- @format -->

# README

## suggest!!(提案補助システム)

提案の質より誰が発言したかにより、意思決定がされる社内政治のような
状況を改善したく、提案及び投票を匿名化するシステムを開発しました。
Suggest!!を利用すれば、周囲の目を気にせず提案ができます。
提案も誰かの意見に賛同するのもすべて匿名です。

### 開発環境

- Ruby,Riails,
- javascript
- scss,Bootstrap

### 機能一覧

- ログイン機能(パスワードのハッシュ化含む)※devise・gem を利用しております。
- テーマ機能(テーマはコンペ方式で、提案を募集したいテーマを投稿し、集まった提案からメンバが投票し、最も良い案を選出します。)
- アンケート機能(テーマフリー提案になり、提案に対して、メンバが賛成・反対をリアクションできます。)
