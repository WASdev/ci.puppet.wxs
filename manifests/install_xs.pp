class wxs::install_xs  {

  $wxs_serverdir = "${wxs::install_root_final}${wxs::params::wxs_serverdirName}"
      
  # extract from source to ${wxs::install_root_final}
  exec { "unzip_es":
    command => "unzip -od ${wxs::install_root_final} ${wxs::puppetFileRoot_final}/${wxs::extremeScaleBinaryName_final}",
    path    => "${wxs::path_final}",
  } ->

  # augment liberty with extremeScale client
  exec { "unjar_es_lib_bin":
    command => "java -jar ${wxs::puppetFileRoot_final}/${wxs::extremeScaleLibertyBinaryName_final} --acceptLicense --overwrite ${wxs::install_root_final}/${wxs::baseDir_final}",
    path    => "${wxs::path_final}",
  }->

  # change permissions for ${wxs::install_root_final}/ObjectGrid/bin
  file { "$wxs_serverdir/bin": mode => 777, }
      
}
