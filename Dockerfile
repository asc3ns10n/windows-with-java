FROM microsoft/windowsservercore

RUN powershell (new-object System.Net.WebClient).Downloadfile('http://javadl.oracle.com/webapps/download/AutoDL?BundleId=210185', 'C:\jreinstaller.exe')
RUN powershell start-process -filepath C:\jreinstaller -passthru -wait -argumentlist "/s,INSTALLDIR=c:\Java\jre"
RUN del C:\jreinstaller.exe

ENV JAVA_HOME=c:\\Java\\jre

RUN powershell $env:PATH = 'c:\Java\jre\bin;' + $env:PATH; \
[Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

ENV JENKINS_HOME=c:\\jenkins

RUN powershell mkdir $env:JENKINS_HOME