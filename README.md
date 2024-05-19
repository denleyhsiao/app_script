脚本集合

* [setup_mac.sh](script/setup_mac.sh): mac下的自动化安装
* [iconv.sh](script/iconv.sh): 将指定目录下的所有文件从gb18030转换成utf-8, 参考[出处](https://blog.csdn.net/ft2028739/article/details/15809019)，**强烈建议执行前做好备份，否则转换失败后数据将丢失**
* [rename_by_remove_sub.sh](script/rename_by_remove_sub.sh): 批量重全名(删除指定子串), `使用前先备份或注释第24行以免出错`, 用法如`./rename_by_remove_sub.sh .. "text_to_remove"`

### download_file
* download_file_if_not_exist: 如果不存在则下载;
* download_file：如果存在则删除后下载;
* clone_repo_if_not_exist: 如果不存在则clone repo;
* clone_repo: 如果存在则删除后clone repo;
* link_clone_file_if_not_exist: 如果不存在则clone repo并建立软链接；
* link_clone_file: 如果存在则删除后clone repo并建立软链接


**注** 
1. 不要轻易使用存在则删除的调用，因为以下二个原因；
2. 存在则删除的调用要提前备份以前修改的；
3. 软链接的path不能以/结束，否则删除时会将所指的实际目录删除。