cd HelloWorld\HelloWorld
msbuild HelloWorld.csproj /p:DeployOnBuild=true /p:PublishProfile=FolderProfile
az webapp deployment source config-zip --src bin\publishHelloWorld.zip -n "tidal-example-web-app-prod" -g "tidal-example-resource-group"
cd ../..