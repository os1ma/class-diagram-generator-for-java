# class-diagram-generator-for-java

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/os1ma/class-diagram-generator-for-java.svg)

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

PlantUML Class Diagram generator for Java

## Requirements
- Docker

## Usage

```bash
$ pwd
my-java-project
$ curl -LO https://raw.githubusercontent.com/os1ma/class-diagram-generator-for-java/master/generate_class_diagram.sh
$ chmod +x generate_class_diagram.sh
$ ./generate_class_diagram.sh .
$ ls
    :
    :
    :
class-diagram.png class-diagram.pu
```

## Links
- [DockerHub - os1ma/class-diagram-generator-for-java](https://hub.docker.com/r/os1ma/class-diagram-generator-for-java)

## References
- http://kazuhito-m.github.io/tech/2017/05/21/reverce-class-diaglam-by-ci
- https://github.com/kazuhito-m/java-odf-edit-sample
