
# 飯田健『Rで学ぶデータサイエンス 14 計量政治分析』（共立出版）
# に掲載されているRコードをダウンロードする
# https://www.kyoritsu-pub.co.jp/bookdetail/9784320019249
tmp <- tempfile()
download.file("https://www.kyoritsu-pub.co.jp/app/file/goods_contents/1730.zip", tmp)
files <- unzip(tmp)
unlink(tmp)
rm(tmp)

# RコードのエンコーディングをUTF-8に変換する
to_utf8 <- function(filename) {
  f_in <- file(filename, open="r", encoding="SHIFT-JIS")
  new_filename = sub(".r", ".R", filename)
  f_out <- file(new_filename, open="wb", encoding="UTF-8")
  lines <- readLines(f_in)
  writeLines(lines, f_out)
  close(f_out)
}
to_utf8("Ch02.r")
to_utf8("Ch03.r")
to_utf8("Ch04.r")
to_utf8("Ch05.r")
to_utf8("Ch06.r")
to_utf8("Ch07.r")
to_utf8("Ch08.r")
to_utf8("Ch09.r")
to_utf8("Ch10.r")

# 東京大学谷口研究室・朝日新聞共同調査
# 「2003年衆院選-04年参院選-05年衆院選世論調査」
# のExcelデータをダウンロードする。
# http://www.masaki.j.u-tokyo.ac.jp/utas/utasv.html
tmp <- tempfile()
download.file("http://www.masaki.j.u-tokyo.ac.jp/utas/utas060104xls.zip", tmp)
files <- unzip(tmp)
unlink(tmp)
rm(tmp)

# Excelデータから q010601 列を切り出して cabsup.csv を作る
utasdata <- read_excel("utas060104.xls")
data <- utasdata['q010601']
names(data) <- c("cabsup")
write.csv(data, "cabsup.csv", row.names=FALSE)
