# drones

This is a template @date=2022-07-19_09-25-12

### scala native deps

```scala
clang openjdk-11-jdk  libgc-dev
set nativeConfig ~= {  _.withClang(java.nio.file.Paths.get(sys.env("CC")))}
```

### sync

https://plugins.drone.io/plugins/rsync
