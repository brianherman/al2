# This script assumes we are starting in  ~/Dropbox/XCodeProjects/aluminum/windows/Framework/Aluminum
# Write-Host ""
# Get-Item Env:\NLTK_DATA # to use enviornmental variables...

# Write-Host $x
$BUNDLE="..\Aluminumlib"  # Our end result bundle
$SRC="..\..\..\src"    # aluminum source code
$WIN32="..\..\..\windows"    # windows source code
$DEBUG=".\Debug"    # location of our lib file
$FREEIMAGE="E:\Libraries\FreeImage-3.16.0Win32\Dist"

if (test-path $BUNDLE){
    rmdir -Recurse $BUNDLE
}

mkdir $BUNDLE\include, $BUNDLE\lib

# $CPP=@( ls $SRC_AL\*.cpp, $WIN32\*.cpp )
$HPP=@( ls $SRC\*.hpp, $WIN32\*.hpp, .\*.h )
$LIB="$DEBUG\Aluminum.lib"

foreach ($header in $HPP) {
    copy-item $header $BUNDLE\include\.
}

copy-item $LIB $BUNDLE\lib\.