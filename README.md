ci.puppet.wxs 
=============
Puppet module for installing and configuring WebSphere eXtreme Scale

It provides the capability to 

1) Install Extreme Scale 

Installs a fresh installation Extreme scale on the node.

2) Augment liberty installation 

Helps to augment liberty with extreme scale features so that the following features can be used in the applications that are being on the liberty application server.

```
eXtremeScale.client-1.1

eXtremeScale.server-1.1

eXtremeScale.webapp-1.1
```
## Installables ## 

The installables i.e WebSphere eXtreme Scale 8.6.0.2 (trial) and  WebSphere Liberty Profile Developers Runtime have to be downloaded and placed in the `files` directory under the module(wxs). They can be downloaded from the following locations.

WebSphere eXtreme Scale 8.6.0.2
-
http://www.ibm.com/developerworks/downloads/ws/wsdg

WebSphere Liberty Profile Developers Runtime -

https://www.ibm.com/developerworks/community/blogs/wasdev/entry/download


##Modules##

`wxs::copy_files_xs` This module will copy the files  i.e (WebSphere eXtreme Scale and WebSphere Liberty Profile Developers Runtime) into location specified by `puppetFileRoot`

`wxs::install_xs` This module will install the WebSphere eXtreme Scale and augment the existing liberty profile with the WebSphere Liberty Profile Developers Runtime. This module should be used when installing standalone eXtreme Scale or when having liberty and eXtreme Scale all installed in a single node.

`wxs::augment_liberty` This module with augment an existing liberty profile with the WebSphere Liberty Profile Developers Runtime. This module should be used when a deployed application on the liberty server needs to connect to a standalone eXtreme Scale.

## Customisations  ##

** The following parameters can be used to customise the way the module behaves.**

[*baseDir*]
The base directory to extract the websphere liberty profile installable eg: If it is specified as liberty then  the server is installed at $install_root/liberty

[*install_root*]
The root directory for installation of the Liberty profile instance

[*java_home*]
The path to the JDK.
Default : /usr/lib/jvm/java-1.6.0

[*puppetFileRoot*]
The parent directory in which installables and other files are copied from the master.
Default : /home/puppetuser/wxs

[*extremeScaleBinaryName*]
The name of the "WebSphere eXtreme Scale" binary. Ex: "extremescaletrial860.zip"
Default : "extremescaletrial860.zip"

This can be downloaded from
http://www.ibm.com/developerworks/downloads/ws/wsdg

[*extremeScaleLibertyBinaryName*]

The name of the "WebSphere Liberty Profile Developers Runtime" binary. Ex: "wxs-wlp_8.6.0.4.jar"
Default : "wxs-wlp_8.6.0.4.jar"

This can be downloaded from
https://www.ibm.com/developerworks/community/blogs/wasdev/entry/download

[*path*]
The path for the shell to run commands like mkdir/unzip. The default value should be enough in most cases.

##Usage##


  To install ExtremeScale
   ```
         class { "wlp":
                   acceptLicense => true,
               }->
         class { "wlp::copy_files":}->
         class { "wlp::install": } ->
         class { "wxs": }->
         class { "wxs::copy_files_xs":}->
         class { "wxs::install_xs": }
   ```

 To Augment a liberty profile with eXtreme Scale feature
    ```
    
		   class { "wlp":
					  acceptLicense => true
				 }
		   class { "wlp::copy_files":}->
		   class { "wlp::install": } ->
		   class { "wxs": }->
		   class { "wxs::augment_liberty": }
    ```