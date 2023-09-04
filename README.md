自动化集合

* [setup_mac.sh](script/setup_mac.sh): mac下的自动化安装
* [iconv.sh](script/iconv.sh): 将指定目录下的所有文件从gb18030转换成utf-8, 参考[出处](https://blog.csdn.net/ft2028739/article/details/15809019)，**强烈建议执行前做好备份，否则转换失败后数据将丢失**
* [rename_by_remove_sub.sh](script/rename_by_remove_sub.sh): 批量重全名(删除指定子串), `使用前先备份或注释第24行以免出错`, 用法如`./rename_by_remove_sub.sh .. "text_to_remove"`