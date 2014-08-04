# QTools

(see below for Japanese description)

(changelogs before initial release is in private repository)

## What is QTools

QTools is a toolkit for managing [Quiz Magic Academy](http://www.konami.jp/am/qma/) arcade tournaments. QTools provides an input interface for smartphones, and an administration console for computers. 

## Active Instances

* Test Instance (requires basic authentication; for now, contact sylph01 for privileges)
    * [Admin](http://qadmin.s01.ninja/)
    * [Mobile](http://qtools.s01.ninja/)

## Functions

* Automatically draw lots for next round
* Creating the list of players passing to the next round
* Calculation of "Sekihairitsu" (narrow-loss ratio; ratio of a player's score to the top player's score) and choosing players to pass by using the calculated Sekihairitsu
* [Qacers_D](http://www.qacers.com/) compatibility

## Link

* [Project Portal](http://qtools-proj.s01.info) - Currently under construction

----

## QToolsとは

[クイズマジックアカデミー](http://www.konami.jp/am/qma/)シリーズの店舗大会のスコア集計・管理ツール。スマートフォンからのスコア入力インターフェースとパソコン用の管理画面を提供する。

### 詳細

[賢竜杯](http://www.kenryuhai.com/)における集計のペーパーレス化に向けた取り組みの一環として作成。目標として:

* 「スマートフォンなどを入力に利用することでジャッジが直接記録情報を入力できるようにし、賢竜杯:Reにおける集計部署相当の部署をまるごと廃止する」
* 「組み合わせ一覧・抽選まで一元化することで組み合わせ表示に遅延するということをなくし、HTMLでリッチな表示を与えることでExcelの生々しい画面を見せずに済むようにする」

などの実現を目指した。

## 動作実例

* テスト環境（実データを含むためBasic認証をかけています。現在のところはsylph01にコンタクトを取ってください）
    * [Admin](http://qadmin.s01.ninja/)
    * [Mobile](http://qtools.s01.ninja/)

## 主な機能

* 次ラウンドの自動抽選
* 次ラウンドへの通過者一覧の自動作成
* 惜敗率計算の自動化と惜敗率に基づく通過者一覧の作成
* [Qacers_D](http://www.qacers.com/)形式での出力

## リンク

* [プロジェクトポータル](http://qtools-proj.s01.info/) - 現在作成中