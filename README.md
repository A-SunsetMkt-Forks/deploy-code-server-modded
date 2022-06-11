# deploy-code-server

一个在[Railway](https://railway.app/)上的[code-server](https://github.com/cdr/code-server)部署。

这里展示了部署此环境所需的配置文件。

配置定位是一个美化的VSCode及适用于Python初学者的临时开发环境，但似乎越来越偏向自己的喜好了。

配置文件部分参考了[这里](https://zhuanlan.zhihu.com/p/386285855)。

由于未知bug请手动安装中文插件，完成后刷新页面即可。

（事实上这个Web版项目code-server移除了所有微软服务，严格上只能叫code-server不能加VS，只是上游代码库相同且*恰巧*界面风格、操作习惯等和VSCode一致，也因此不能直接从微软的Marketplace下载插件而是用了另一个开源插件来源）

（微软发布的源码库是Code - OSS，Visual Studio Code is a distribution of the Code - OSS repository with Microsoft-specific customizations released under a traditional Microsoft product license.）

如果想使用微软的Marketplace：

```shell
export EXTENSIONS_GALLERY='{"serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery"}'
```

然而，微软的EULA禁止这种行为。

## 快速部署

个人建议使用Railway部署，点击下方按钮使用本仓库配置。

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template?template=https%3A%2F%2Fgithub.com%2Flwd-temp%2Fdeploy-code-server&envs=PASSWORD%2CGIT_REPO&PASSWORDDesc=Your+password+to+log+in+to+code-server+with&GIT_REPODesc=A+git+repo+to+clone+and+open+in+code-server+%28ex.+https%3A%2F%2Fgithub.com%2Fcdr%2Fdocs.git%29)
