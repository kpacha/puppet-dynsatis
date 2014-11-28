define dynsatis::apache(
  $host,
  $devmode,
  $project_path
){
  class { 'apache': 
    mpm_module => 'prefork'
  }
  include ::apache::mod::rewrite
  include ::apache::mod::php

  dynsatis::apache::vhost { 'prod':
    host         => $host,
    project_path => $project_path,
    devmode      => false
  }
  if($devmode){
    dynsatis::apache::vhost { 'devel':
      host         => $host,
      project_path => $project_path,
      devmode      => true
    }
  }
}