#!/bin/sh

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk update
sdk install java 15.0.2.j9-adpt
sdk install java
sdk install scala 3.0.0-RC1
sdk install scala
sdk install kotlin 1.4.31
sdk install gradle 6.8.3
sdk install sbt 1.5.0-RC1
sdk install dotty 0.27.0-RC1
sdk install maven 3.6.3
sdk install spark 3.0.1
sdk default java 15.0.2.j9-adpt
sdk default scala 3.0.0-RC1

