# 用 Verilog 重做 nand2tetris 1~5 章  

* 12/10 第一章(除Mux系列)完成
* 12/11 第一章全完成 第二章(除ALU)完成
* 12/13 第二章全完成
* 12/14 第三章全完成
* 12/15 第五章全完成

## 遭遇的問題:

1. wire作用??? (Mux4Way16,Mux8Way16,FullAdder...)
2. 不懂為何 Mux4Way16 & Mux8Way16 要 wire (沒有vvp好像一樣，但有Warning)
3. RAM的不同寫法
4. CPU梳理
6. 密密麻麻看得昏天暗地


## 心得:

這學期透過 nand2tetris 學習計算機結構，以不同於純粹算執行時間，從最底層、簡單的邏輯閘開始，到中間Mux，和後來的大魔王CPU，一路上跌跌撞撞，雖然有時候會卡住好一陣子，但慢慢的把一台電腦該有的元件一個一個的寫出來，直至最後能用程式模擬電腦執行一些簡單的小程式並且程式成功執行時，讓人蠻有成就感的有如醍醐灌頂，不禁一陣喜悅湧上心頭，這也讓我了解科技要發展到今日的不容易。

## 備註及參考:

[Verilog Operators](https://www.chipverify.com/verilog/verilog-operators)
[DFF](https://www.javatpoint.com/verilog-d-flip-flop) 

邏輯閘Verilog程式均改寫自原本1-5章
程式中部分測試程式來自[老師的gitlab](https://gitlab.com/cccnqu111/co/-/tree/master/verilog/02-nand2tetris)，使用部分(程式中//標註範圍//):
```
gates16_test.v
Mux_test.v
ALU_test.v
03gates.v (參考DFF、PC的loadIncReset)
RAM16_test.v
PC_test.v
computer_test.v
sum.hack(全部)
```