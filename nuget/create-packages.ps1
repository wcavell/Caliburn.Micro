function Get-ScriptDirectory {
  $Invoc = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $Invoc.MyCommand.Path 
}

# Hang on to current location
pushd . 

cd (Get-ScriptDirectory)

ls -Filter lib | del -recurse
mkdir lib

copy ..\bin\WPF\Release .\lib\Net40 -Recurse
copy ..\bin\Silverlight\Release .\lib\SL40 -Recurse
copy ..\bin\WP7\Release .\lib\SL40-wp -Recurse

.\nuget.exe pack caliburn.micro.nuspec

popd
