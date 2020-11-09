# 繁簡體字轉換表

## 說明

本倉庫的兩個轉換表根據[開放詞典網](http://kaifangcidian.com/)數據，對照繁簡體漢字，以便於提供實時轉換等功能。2009年起，[開放漢語詞典](http://kaifangcidian.com/han/han)便應用這兩個對照表以提供詞條繁簡版本，一直沿用至今。

值得注意的是，這是一個字形轉換表，而不是一個本地化工具。相對於其他繁簡轉換工具，本項目採用“簡單”（或“愚能”）轉換而非“智能”轉換為原則，僅轉字符而不轉地域用詞，例如繁體/正體的“**電腦**”一詞簡化的結果是“电脑”而非“计算机”，而“**数据库**”轉成繁體字則是“數據庫”而不是“資料庫”，因為原則上一個決定採用簡體或繁體漢字來書寫文章的作者是可能住在世界任何地區，也可能有任何文化背景和寫法習慣，包括用繁體字寫出“大陸用詞”或者用簡體字寫出“港台用詞”，因此應儘量尊重作者的意願，純粹對個別字符所屬的字形進行轉換。

以上介紹的轉換方式最大優點包括輕量、快速、方便、簡潔，可以有效嵌入多個應用環境。當然亦有缺點，如簡繁轉換中眾所週知的“[一對多](https://github.com/kfcd/yiduiduo)”問題和語法解析問題，例如“**發**”和“**髮**”的簡化字皆為“**发**”，必須視乎語文場合和作者背景知識來決定簡化字在該詞中的含義，而無法自動進行判斷。又或者像“**于经理**”，“**于老师**”中的“**于**”字可能是介詞“於”，也可能是于姓的“于”字，因為涉及到語法和句子的機器分析，這類難點並非一般“智能轉換”工具所能解決的問題。既然如此，我們就得假設進行簡繁轉換是不得不加以人為校對覈實才能算可靠。

## 數據格式

### 轉換表

主目錄裡的兩個文本文件分別為繁體至簡體和簡體至繁體的轉換表，以製表符分隔。

* `fanjian.txt` (繁=>簡)
* `jianfan.txt` (簡=>繁)

每組詞以換行符（`\n`）分割
單個詞以製表符（`\t`）分割

### Sed 腳本

在`sed`文件夾裡面有兩個sed腳本：

* `fanjian.sed` (繁=>簡)
* `jianfan.sed` (簡=>繁)

運行方式很簡單：

* 轉換字符串：`echo "转换" | sed -f jianfan.sed`（結果：`"轉換"`）
* 轉換文本文件：`sed -f jianfan.sed text.txt > convert.txt`

### JSON

在文件夾 `dist/json` 裡有兩個文檔 `fanjian.json` 和 `jianfan.json`，分別為繁轉簡和簡轉繁的JSON格式字串。

## 腳本

`rb`文件夾裡有一個小生成腳本 `shengcheng.rb`，可以用 Ruby 運行如下：

    ruby shengcheng.rb

以上命令會按照 `fanjian.txt` 和 `jianfan.txt` 的內容在 `dist` 下的子目錄裡自動生成 sed, JSON 等格式的輸出文件。

## 實現示例

* Sed
* Ruby
* JavaScript

## 另見

* [漢字簡繁轉換一對多字表](https://github.com/kfcd/yiduiduo)
* [開放中文轉換](https://github.com/BYVoid/OpenCC) - 智能中文繁簡轉換

## 版權

© 2015 [開放詞典](http://www.kaifangcidian.com)

本表依照創作共用（創用CC/知識共享）姓名標示（署名）協議發佈。

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/"><img alt="創用 CC 授權條款" style="border-width:0" src="https://i.creativecommons.org/l/by/3.0/88x31.png" /></a><br />本著作係採用<a rel="license" href="http://creativecommons.org/licenses/by/3.0/">創用 CC 姓名標示 3.0 未本地化 授權條款</a>授權.
