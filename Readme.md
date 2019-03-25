

现在换源之后将不自动进行系统更新

---

命令行安装
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/quanweiGithub/Ubuntu-China-Source/master/ChangeSource.sh)"
```

---

支持自动配置的命令行安装

修改后续参数 `${ver} ${src}`，比如：
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/quanweiGithub/Ubuntu-China-Source/master/ChangeSource.sh) 18 ali"
```

可选参数列表为：
```
ubuntu 版本：
  14: 14.04
  16: 16.04
  18: 18.04
可选的源：
  ali 阿里
  thu 清华
  163 网易
```

---

（TODO: update release link）

该篇博客主要介绍使用脚本快速更换Ubuntu源，方便快捷，直接上图。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190107152645686.gif)

直接从下边的链接中下载脚本，直接运行就是可以的。

百度云网盘：https://pan.baidu.com/s/1HE59uB0bHKKHOuPuYkybIg
CSDN：https://download.csdn.net/download/qq_35451572/10900832

我们可以根据自己系统的版本，想使用的源进行选择，直接输入数字进行选择就是可以的。方便快捷。

具体可以查看GitHub：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190107153257235.png)
