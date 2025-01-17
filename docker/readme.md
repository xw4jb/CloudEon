# CloudEon 安装指南

## 1. 生成安装包

执行以下命令生成 Cloudeon 安装包：

```shell
mvn clean package -Dmaven.test.skip
```

生成的安装包位于 cloudeon-assembly/target 目录下，格式为 .tar.gz 或 .zip。

## 二 构建并推送镜像

### 1.构建Docker镜像

```shell
file_path="../cloudeon-assembly/target/cloudeon-assembly-v2.0.0-beta.1-release.tar.gz"
# 提取文件名部分
filename="${file_path##*/}"
cp $file_path ./
# 去掉前缀和后缀
version="${filename#cloudeon-assembly-}"
version="${version%-release*}"

docker build --build-arg CLOUDEON_VERSION=$version \
             -t registry.cn-guangzhou.aliyuncs.com/bigdata200/cloudeon:$version .

rm -f ./$filename

```

### 2.推送 Docker 镜像

执行以下命令将镜像推送到 Docker 仓库：
```shell
docker push registry.cn-guangzhou.aliyuncs.com/bigdata200/cloudeon:$version

```

## 三 运行 Cloudeon 容器

### 1.简单运行

使用默认配置运行 Cloudeon 容器：
```shell
image=registry.cn-guangzhou.aliyuncs.com/bigdata200/cloudeon:v2.0.0-beta.1

docker run -d --name cloudeon -p 7800:7700 $image

```

### 2.自定义配置文件运行：

使用自定义配置文件运行 Cloudeon 容器：
```shell
image=registry.cn-guangzhou.aliyuncs.com/bigdata200/cloudeon:v2.0.0-beta.1
conf_path_dir=/opt/cloudeon

# 运行临时容器把配置文件复制到外部，如果已有配置文件则此步骤可以跳过
docker run --rm \
--entrypoint /bin/bash \
-v $conf_path_dir:/data/workspace \
$image \
-c "cp -r  /opt/cloudeon/conf /data/workspace/conf && cp -r /opt/cloudeon/stack /data/workspace/stack"

# 根据需求修改配置文件
# 正式运行
docker rm -f cloudeon
docker run -d --name cloudeon \
-e DB_ACTIVE=mysql \
-v $conf_path_dir/conf:/opt/cloudeon/conf \
-v $conf_path_dir/stack:/opt/cloudeon/stack \
-p 7700:7700 $image

docker logs --tail 100 -f cloudeon

```