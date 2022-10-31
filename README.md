# deploy-code-server

一个在任意Docker容器部署的[code-server](https://github.com/cdr/code-server)。

这里展示了部署此环境所需的配置文件。

配置定位是一个美化的VSCode及适用于Python初学者的临时开发环境，但似乎越来越偏向自己的喜好了。

配置文件部分参考了[这里](https://zhuanlan.zhihu.com/p/386285855)。

由于未知bug请手动安装中文插件，完成后刷新页面即可。

如果想使用微软的Marketplace：

```shell
export EXTENSIONS_GALLERY='{"serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery"}'
```

然而，微软的EULA禁止这种行为。

## 环境变量

`PASSWORD`: 密码，进入界面时输入。

`GIT_REPO`: 默认打开的Git仓库，第一次启动时自动clone。

## 其他

需要注意，大部分Docker部署平台不支持容器root权限。

## Docker镜像

https://hub.docker.com/r/lwdtemp/deploy-code-server
