# MultiSocketServerFX-native-image
This application is written in Java using the Java Module System and the JavaFX API. It is derived from the original MultiSocketServerFX project https://github.com/jtconnors/MultiSocketServerFX, and has been modified to utilize **GraalVM and generate a native-image version of the MultiSocketServerFX program. **

MultiSocketServerFX is a JavaFX UI server socket application demonstrating multiple socket client connections simultaneously. It can:

   - connect to a socket at a configurable port
   - handle multiple client socket connections at the same time and indicate the number of connections
   - receive text messages from a connected socket
   - send text messages to all connected sockets
   - retrieve sent and received messages

It is typically used in conjucntion with a client-side JavaFX UI application called ```SocketClientFX```.
It can be found here: https://github.com/jtconnors/SocketClientFX

This version of the source code is tagged ```1.1-JDK11-maven```. As its name suggests, it is specific to JDK 11 and can be built with the apache maven build lifecycle system. It requires the GraalVM Enterprise Edition SDK as well as the native-image component to operate properly. As of the creation of this project, GraalVM 20.2.0 is the latest version.

This project works on MacOS or Linux..

**Requirements:**

1. Your default JDK should point to a valid GraalVM JDK 11 runtime in your PATH.
2. Prior to running any of the scripts in this project the ```JAVA_HOME``` environment variable must be set to a valid GraalVM runtime.

Of note, the following maven goals can be executed:

   - ```mvn clean```
   - ```mvn dependency:copy-dependencies``` - to pull down dependent ```javafx``` and ```com.jtconnors.socket``` modules
   - ```mvn compile``` - to build the application
   - ```mvn package``` - to create the ```MultiSocketServerFX``` module as both a jar file and a native image
   - ```mvn exec:java``` to run the (non native-image) application with the Java runtime

Furthermore, additional ```.sh``` files are provided in the ```sh/``` directory:
   - ```sh/run.sh``` - script file to run the application from the module path
   - ```sh/run-simplified.sh`` - alternative script file to run the application, determines main class from ```SocketClientFX``` module
   - ```sh/link.sh```- creates a runtime image using the ```jlink``` utility
   - ```sh/run-native-image.sh``` - runs the native image version of the application

Notes:
   - These scripts have a few available command-line options.  To print out
the options, add ```-?``` or ```--help``` as an argument to any script.
   - These scripts share common properties that can be found in ```env.sh```.  It may need to be slightly modified to match  your specific configuration.

See also:

- SocketClientFX: https://github.com/jtconnors/SocketClientFX
- SocketServerFX: https://github.com/jtconnors/SocketServerFX
- maven-com.jtconnors.socket: https://github.com/jtconnors/maven-com.jtconnors.socket
