@echo off
echo === Building DevOps Application ===

echo Creating target directory...
if not exist target\classes mkdir target\classes

echo Compiling source files...
dir /s /b src\*.java > sources.txt
javac -d target\classes @sources.txt

echo === Running Tests ===
java -cp target\classes com.example.HelloDevOpsTest

echo === Creating JAR ===
jar cfe app.jar com.example.HelloDevOps -C target\classes .

echo === Running Application ===
java -jar app.jar
