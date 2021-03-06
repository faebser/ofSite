<%inherit file="/_templates/markdown.mako" />

android eclipse
===============

The Android distribution of openFrameworks is based on the Eclipse IDE, the current version of the Android plugin for eclipse has several problems with projects that mix c++ and java code so the projects are currently using a custom toolchain based on makefiles + ant tasks to compile and install applications. If you are used  
to android development in eclipse, things are a little different check the following instructions to know how to  
install the development environment and compile/install applications.

Right now this is only tested on linux and osx to use it on windows check the instruction on this link: http://www.multigesture.net/articles/how-to-setup-openframeworks-for-android-on-windows/

To use it you will need Eclipse, the Android SDK, the Android NDK, the Android Eclipse plugin and the openFrameworks Android package.

If you have already installed OF for android before, this instructions have changed quite a bit and it's recommended to start from scratch, even with a new install of Eclipse and it's mandatory to use the latest versions of the Android SDK (10) and NDK (r5b)

**a) Eclipse**: download the C/C++ edition for your platform from here:

[http://www.eclipse.org/downloads/][0]

![eclipse_cdt_download](eclipse_cdt_download.png)

Ubuntu users: don't use the version in the repositories is very outdated.

Eclipse doesn't have any install, but you will need Java to use it, in case you don't have Java installed in your system, you can download it from:

[http://java.com][1]

in the case of Linux it will be in the official repositories, for example in Ubuntu:

    sudo apt-get install openjdk-6-jdk

or

    sudo apt-get install sun-java6-jdk (this doesn't exist from maverick)

**b) Andorid SDK**: this is the software that allows to develop in Java for Android, even if we are going to program in C/C++ we'll need it. You can download it from:

[http://developer.android.com/sdk/index.html][2]

uncompress it in any folder on your hard disk, later you'll need to tell the OF makefiles where to find it.

**c) Android NDK**: this is the c/c++ compiler, headers and libraries for android. Download it from:  
[http://developer.android.com/sdk/ndk/index.html][3]

There's a bug in the official ndk that makes apps crash on 2.1 and lower versions of Android so by now OF android will only work in 2.2 and above

Also uncompress it to any place in your hd we'll tell later OF where to find it.

**d) openFrameworks for Android package**: download it from the downloads page:

[http://openframeworks.cc/download][4]

**e) Install ant:**

This tool is used internally by Eclipse and the Android tools to set projects, the current OF distribution uses it to install and run things in the phone "manually"

- Linux:

    sudo apt-get install ant-1.8

or for newer distributions:

    sudo apt-get install ant

- OSX:

download and uncompress 1.8 or greater from [http://ant.apache.org/bindownload.cgi][5]

**f) Set the paths of the SDK, NDK and ant  
**

Edit:

    OF/libs/openFrameworksCompiled/project/android/paths.make

this will tell OF where to find the sdk, ndk and ant

- set paths of sdk & ndk to the uncompressed folders

- set ANT\_HOME:
Linux: /usr  
OSX: set it to the folder where you uncompressed ant before

**g) Start eclipse**: you will see a pop up telling what workspace to use, the first time it will create the needed files. just point it to
openFrameworks/apps/androidExamples.

**h) Android Eclipse plugin**:

There's detailed instructions here: [http://developer.android.com/sdk/eclipse-adt.html][6]  
To install it, inside Eclipse go to
Help \> Install new software...

![eclipse plugins](eclipse_android_plugin0-600x522.png)

press add... and enter the following info:
Name: Android SDK  
Location: https://dl-ssl.google.com/android/eclipse/

![android eclipse plugin info](eclipse-plugin1.png)

press OK and select the new repository in the "Work with:" drop down box in case it's not already selected

you will see the sdk plugin in the list, called Developer Tools:

![eclipse_android_plugin2](eclipse_android_plugin2-600x522.png)

select it and press next till you get to the terms of the license screen, check the "I accept the terms of the license" check button and press Finish. Eclipse will download and install the Android plugin. Once it finishes press yes in the popup to restart Eclipse.

**i) Set eclipse java compiler compliance to 1.5:**

In the last version of Eclipse the java compatibility is set to version 6 but android needs version 5\. to change it, in
Window \> Preferences \> Java \> Compiler 

The compiler compliance settings should be set to 1.5\.

![](java_compiler_preferences-600x437.png)




**j) Configuring the Android plugin**: 

Once we have installed the android plugin we need to tell it where to find the sdk. In eclipse go to
Window \> Preferences \> Android 

and set the SDK location by browsing to the folder where you uncompressed the SDK before.

![android_prefs](android_prefs-600x449.png)

  


Now Eclipse knows where the SDK is.

Next you'll need to install the api files and optionally create an emulator to be able to test programs without uploading to the phone. Press the Android button in the Eclipse toolbar:

![android_button](android_button.png)

First you need to install the api package. Just click on the "Available Packages" tab, and choose the SDK Platform for version 2.2 + the sdk platform tools, it's important to use version 2.2 since the makefiles are configured for that version, it doesn't matter what version of the OS you want to develop for. You can optionally install other versions and change the makefile to use that instead.

Once that is done you can create a new virtual device. Just select a name, the target and a size for the virtual sd-card.

**k) Import openFrameworks into Eclipse:** 

Now Eclipse has been completely configured to work with OF for Android, the last step is to import all the projects in the workspace. Go to
File \> Import and select General \> Existing projects in the workspace...

![import first screen](import0-600x508.png)

Import in this order: 
OF/libs  
OF/libs/openFrameworks  
OF/addons/ofxAndroid/ofAndroidLib  
OF/apps/androidExamples

**l) Compile OF**:

In the left part of the window, select the openFrameworks project and from the toolbar or the menu build the Android target.

![](android-compile-OF.png)

**m) Enable development in your device:**
Adjustments \> Applications \> Development \> USB Debug (the device needs to be disconnected from the computer)

**n) Connect the device now:**

If you don't have a device eclipse will start the emulator for you
**Linux users**: adb needs permissions to access the usb device, follow the instructions here to fix your device permissions:

[http://developer.android.com/guide/developing/device.html][7]

**o) Create an install external tool and use it to install and run projects on the device or emulator**
Run \> External Tools \> External Tools Configuration
![](android-external-tools1.png)

Select program and press New, name the new configuration: Android Install Main:

<%text filter="h">
    Location: /usr/bin/make 
    
    Working Directory: ${project\_loc} 
    
    Arguments: AndroidInstall PROJECT\_PATH=${project\_loc}
    
    Refresh:
    Mark Refresh resources upon completion  
    Select The selected resource
    
    Build:
    Mark Build before launch  
    Select The project containing the selected resource  
    Mark Include referenced projects
</%text>


Press Apply and Close

![](Screenshot-External-Tools-Configurations--600x561.png)

**p) Now to install and run a project in the device:**

- connect the device  
- check that is being detected and restart adb server if necesary  
- select the AndroidRelease target

![](android-compile-example.png)

- press the play button with a toolbox or Run \> External Tools \> Android Install

![](toolbox-button.png)

If everything went ok, the example should start on the device

**Useful advices:**

- There's no data folder in the android apps, since Android has it's own method for resources and its really restrictive about it. By now you'll need to put them in
res/raw Now everything in bin/data will get compressed to res/raw and then uncompressed and automatically copied to:  
sdcard/cc.openframeworks.appname 

before running the app.

If you have resources that change like xml config files, it's better to generate them from the code since uploading them to the phone will overwrite the configuration

- If there's no sd card in the device, examples that have resources won't work by now

- Naming of resources is really restrictive in Android, for example you cannot have several resources with the same name even if they have different extensions.

- The AndroidDebug target does a different compilation process of the native code that allows to detect linker errors that won't be detected when compiling in AndroidRelease mode. Is recomended to compile your application in AndroidDebug mode at least once or if your application crashes before starting. To install applications on the device or emulator is recommended to use the AndroidRelease mode since it's faster and the applications will be much smaller. There's also no support for debug for native applications in eclipse but you could theoretically use the ndk tools to debug an application compiled with AndroidDebug.

- Test your application very often, even if the last ndk allows for debugging, there's no support for native debugging in eclipse and setting it up manually with the ndk is pretty hard. when an application crashes the debugger dies too, so it's hard to debug bad memory accesses and similar bugs.

- Use the LogCat view in Eclipse. When programming for the Android you cannot see the output of cout or printf, but if you use ofLog you can see it's output in the log cat. to open the view, go to
Window \> Show View \> Others \> Android \> LogCat

![showviewlogcat](showviewlogcat.png)

you can see the output of the compiler in the Console tab and the output of your app in the LogCat one. Everything that is output by OF through ofLog will have an OF tag so you can use filters to see only your application's output.

-There's a bug in the Android plugin that makes eclipse to build every c/c++ project in your workspace before running any app, so try to keep your workspaces small. you can have as many workspaces as you want:

- create a folder inside apps

- open eclipse telling it to use this new folder as a workspace and do the import step again for the new folder, including openFrameworks, libs, addons but instead of importing all the examples, import only androidEmptyExample to have a template for your new projects.

**- Creating new applications:**

You can copy any of the examples and start a new application from there.

You'll need to change the name of the application in different places:

- when you copy the application from an example set the name you want to use, let's say your application is called myApp  
- in res/values/strings.xml change app\_name value to the name of your application  
- in AndroidManifest.xml change the name of the package from cc.openFrameworks.exampleName to cc.openframeworks.myApp  
- in srcJava, select the package cc.openFrameworks.exampleName, press F2 to rename it and call it cc.openframeworks.myApp

It's important to keep the package prefix as cc.openframeworks or somethings can stop working, this will be fixed in future versions when eclipse support for native code is better[0]: http://www.eclipse.org/downloads/
[1]: http://java.com
[2]: http://personal-editor.com/%20http://developer.android.com/sdk/index.html
[3]: http://developer.android.com/sdk/ndk/index.html
[4]: http://openframeworks.cc/download
[5]: http://ant.apache.org/bindownload.cgi
[6]: http://developer.android.com/sdk/eclipse-adt.html
[7]: http://developer.android.com/guide/developing/device.html


