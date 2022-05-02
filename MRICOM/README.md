
### MRI.COM タグ打ち

  1. Redmine ロードマップの変更、追加
  2. リリース・ノートの文案の作成
  3. tag_mricom.sh
  4. git push origin/github [stable ver]
  5. GitHubリリースの作成
      https://github.com/mri-ocean/MRICOM/releases
  6. scp MRICOM-[version]-[date].tgz ocpublic@front.i.mri-jma.go.jp:~/MRICOM/
  7. make_redmine_news.sh
  8. make_mail.sh  mricom@mri-jma.go.jp に投稿

### MXE タグ打ち

  1. Docker で MXE の単体テスト (~/test.sh)
  2. 必要があれば修正作業
  3. Redmine 棚卸し、ロードマップの追加
  4. リリース・ノートの文案の作成
  5. tag_mxe.sh
  6. git push github master, タグ
  7. GitHubリリースの作成

### rectangle タグ打ち

  1. MXE の更新とマージ, push
  2. Redmine 棚卸し、ロードマップの追加
  3. リリース・ノートの文案の作成
  4. tag_package.sh
  6. git push github master, タグ
  7. GitHubリリースの作成

### webページ更新

../wiki/ で作業

### JPN タグ打ち

  1. MXE の更新とマージ, push
  2. 必要があれば統合テスト
  3. Redmine 棚卸し、ロードマップの追加
  4. tag_package.sh
