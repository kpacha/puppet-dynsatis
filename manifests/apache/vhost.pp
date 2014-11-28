define dynsatis::apache::vhost(
  $devmode,
  $host,
  $project_path
){
  if($devmode){
    $hostname    = "dev.$host"
    $environment = 'development'
  } else {
    $hostname    = $host
    $environment = 'production'
  }

  $docroot = "$project_path/web"

  ::apache::vhost { $hostname:
    port          => '80',
    docroot       => $docroot,
    setenv        => ["APPLICATION_ENV $environment"],
    directories   => [
      {
        path            => $docroot,
        directoryindex  => 'index.php',
        options         => ['-Indexes'],
        allow_override  => [ 'None' ],
        order           => 'Allow,Deny',
        custom_fragment => 'RewriteEngine On
          RewriteCond %{REQUEST_FILENAME} -s [OR]
          RewriteCond %{REQUEST_FILENAME} -l [OR]
          RewriteCond %{REQUEST_FILENAME} -d
          RewriteRule ^.*$ - [NC,L]
          RewriteRule ^.*$ index.php [NC,L]'
      }
    ]
  }
}