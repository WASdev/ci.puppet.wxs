class wxs::copy_files_xs  {
  exec { "create_directory_xs":
    command => "mkdir -p ${wxs::puppetFileRoot_final}",
    path => "${wxs::path_final}",
  }
  ->  
  file { "${wxs::puppetFileRoot_final}/${wxs::extremeScaleBinaryName_final}":
    mode   => 777,
    owner  => root,
    group  => root,
    source => "puppet:///modules/wxs/${wxs::extremeScaleBinaryName_final}",
  }
  ->  
  file {"${wxs::puppetFileRoot_final}/${wxs::extremeScaleLibertyBinaryName_final}":
    mode   => 777,
    owner  => root,
    group  => root,
    source => "puppet:///modules/wxs/${wxs::extremeScaleLibertyBinaryName_final}",
  }  
}
