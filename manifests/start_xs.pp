class wxs::start_xs {
   
  exec { "create_catalog_server":
    command     => "${liberty::variables::wxs_serverdir}/acmeair/runcat.sh &",
    path    => "${liberty::variables::path}",
    timeout     => 1800,
    environment => ["JAVA_HOME=${liberty::variables::java_home}"],
    } ->
    
  # Start the container server
  exec { "run_catalog_container":
    command     => "${liberty::variables::wxs_serverdir}/acmeair/runcontainer.sh c0 &",
    path    => "${liberty::variables::path}",
    timeout     => 1800,
    environment => ["JAVA_HOME=${liberty::variables::java_home}"],
  }
}
