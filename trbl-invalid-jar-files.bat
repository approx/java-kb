echo Looking for Hibernate Core 5.0.11.Final JAR
cd "%USERPROFILE%\.m2\repository\org\hibernate\hibernate-core\5.0.11.Final
echo Java will check if JAR file is valid...
pause
"%JAVA_HOME%\bin\jar" tf hibernate-core-5.0.11.Final.jar
