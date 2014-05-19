class wxs::augment_liberty {
  exec { "create_directory_xs":
    command => "mkdir -p ${wxs::puppetFileRoot_final}",
    path => "${wxs::path_final}",
  }->
  file {"${wxs::puppetFileRoot_final}/${wxs::extremeScaleLibertyBinaryName_final}":
    mode   => 777,
    owner  => root,
    group  => root,
    source => "puppet:///modules/wxs/${wxs::extremeScaleLibertyBinaryName_final}",
  }->
  # augment liberty with extremeScale client
  exec { "unjar_es_lib_bin":
    command => "java -jar ${wxs::puppetFileRoot_final}/${wxs::extremeScaleLibertyBinaryName_final} --acceptLicense --overwrite ${wxs::install_root_final}/${wxs::baseDir_final}",
    path    => "${wxs::path_final}",
  }

}
