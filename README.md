#Usage 
Create preparation test
1. Setup command (optional): ```chmod +x ./build/prepare.sh && ./build/prepare.sh```
2. Run command: ```export DOTNET_CLI_HOME="/tmp" && chmod +x ./build/build.sh && ./build/build.sh```

This creates for each _Task_ the _publish_ folder with built binaries.  

So you can run in tests ```./src/cpp/Task2/publish/Program```.
