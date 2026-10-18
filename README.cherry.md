# Special Notes for Honor 4X

## Docker 宿主机系统的操作

下载 lineage-15.1-20200225-nightly-cherry-signed.zip

参考 [Extracting proprietary blobs from LineageOS zip files manually](https://wiki.lineageos.org/extracting_blobs_from_zips_manually)

在 Docker 宿主机系统执行以下命令：

创建临时目录并进入目录路径

```bash
mkdir -p ~/android/system_dump/
cd ~/android/system_dump/
```

从已下载的 lineage-xxx.zip 提取所有文件

```bash
unzip path/to/lineage-*.zip
```

使用 brotli 工具解压 .dat.br 文件

```bash
sudo apt install brotli
brotli --decompress --output=system.new.dat system.new.dat.br
```

获取 sdat2img 工具

```bash
git clone https://github.com/xpirt/sdat2img.git
```

使用 sdat2img 工具提取系统镜像

```bash
sdat2img/sdat2img.py system.transfer.list system.new.dat system.img
```

挂载系统镜像

```bash
mkdir -p system/ 
sudo mount -r system.img system/
```

至此，Docker 宿主机系统需要的准备工作已完成

## Docker 构建系统中的操作

运行 run.sh 进入 Docker 构建系统中

进入设备目录并提取所需文件

```bash
cd ~/android/device/huawei/cherry
./extract-files.sh ~/android/system_dump/
```


