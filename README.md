# dotfiles for mac

> ATTENTION: 由于mac对于system-wide environment variable支持较差（gui程序），通过user launchd file(plist)支持，但存在种种缺陷。我投降，不再遵守XDG。

## Dependency

### 应用商店

* Blurred: 专注工具
* Hidden Bar: 强迫症工具
* Fluent Reader: RSS阅读工具

### 手动安装

* [xcode](https://developer.apple.com/download/all/): macport依赖
* [MacPort](https://www.macports.org/): mac下K.I.S.S开源包管理工具
* [Rectangle](https://rectangleapp.com/): mac下窗口管理工具
* [obsidian](https://obsidian.md/): 知识管理平台
* [picgo](https://github.com/Molunerfinn/PicGo): 图片上传工具
* [Insomnia](https://insomnia.rest/): postman的开源替代品，简介、高效
* [Deepl](https://www.deepl.com/en/app/): 德国的翻译工具

### macport安装

1. 系统初始化[install.sh](/install/install.sh)
2. 软件包安装[port.sh](/install/port.sh)
