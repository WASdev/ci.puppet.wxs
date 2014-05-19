# Class: ibm_exterme_scale
#
# This module manages ibm_exterme_scale
#
# Parameters: 
#
#    [*baseDir*]
#    The base directory to extract the websphere liberty profile installable eg: If it is specified as liberty then
#    the server is installed at $install_root/liberty
#
#    [*install_root*]
#    The root directory for installation of the Liberty profile instance
#
#    [*java_home*]
#    The path to the JDK.
#    Default : /usr/lib/jvm/java-1.6.0
#
#    [*puppetFileRoot*]
#    The parent directory in which installables and other files are copied from the master.
#    Default : /home/puppetuser/wxs
#
#    [*extremeScaleBinaryName*]
#    The name of the "WebSphere eXtreme Scale" binary. Ex: "extremescaletrial860.zip"
#    Default : "extremescaletrial860.zip"
#
#    This can be downloaded from 
#
#    http://www.ibm.com/developerworks/downloads/ws/wsdg
#
#    [*extremeScaleLibertyBinaryName*]
#    The name of the "WebSphere Liberty Profile Developers Runtime" binary. Ex: "wxs-wlp_8.6.0.4.jar"
#    Default : "wxs-wlp_8.6.0.4.jar"
#    This can be downloaded from 
#
#    https://www.ibm.com/developerworks/community/blogs/wasdev/entry/download
#
#    [*path*]
#    The path for the shell to run commands like mkdir/unzip. The default value should be enough in most cases.
#
# Requires: wlp
#
# Sample Usage:
#
#   To install ExtremeScale
#
#	   class { "wlp":
#		     acceptLicense => true,
#		 }->
#	   class { "wlp::copy_files":}->
#	   class { "wlp::install": } ->
#	   class { "wxs": }->
#	   class { "wxs::copy_files_xs":}->
#	   class { "wxs::install_xs": }->
#
#
#  To Augment a liberty profile with eXtreme Scale feature
#	
#	  class { "wlp":
#		    acceptLicense => true
#
#		}
#	 class { "wlp::copy_files":}->
#	 class { "wlp::install": } ->
#	 class { "wxs": }->
#	 class { "wxs::augment_liberty": }->
#
#
class wxs (
  $baseDir        = 'UNSET',
  $install_root   = 'UNSET',
  $java_home      = 'UNSET',
  $puppetFileRoot = 'UNSET',
  $extremeScaleBinaryName = 'UNSET',
  $extremeScaleLibertyBinaryName = 'UNSET',
  $extremeScaleBinary = 'UNSET',
  $path           = 'UNSET'
  ){
  include wxs::params

  $baseDir_final = $baseDir? {
    'UNSET' => $::wxs::params::baseDir,
    default => $baseDir,
  }
  $install_root_final = $install_root? {
    'UNSET' => $::wxs::params::install_root,
    default => $install_root,
  }
  $java_home_final = $java_home? {
    'UNSET' => $::wxs::params::java_home,
    default => $java_home,
  }
  $puppetFileRoot_final = $puppetFileRoot? {
    'UNSET' => $::wxs::params::puppetFileRoot,
    default => $puppetFileRoot,
  }  
  $extremeScaleBinaryName_final = $extremeScaleBinaryName? {
    'UNSET' => $::wxs::params::extremeScaleBinaryName,
    default => $extremeScaleBinaryName,
  }
  $extremeScaleLibertyBinaryName_final = $extremeScaleLibertyBinaryName? {
    'UNSET' => $::wxs::params::extremeScaleLibertyBinaryName,
    default => $extremeScaleLibertyBinaryName,    
  }
  $path_final = $path ? {
    'UNSET' => $::wxs::params::path,
    default => $path,
  }

  $extremeScaleBinary_final = "${puppetFileRoot_final}/${extremeScaleBinaryName_final}" 
}
