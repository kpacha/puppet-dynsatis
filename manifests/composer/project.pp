class dynsatis::composer::project(
  $project_path,
  $devmode
){
  composer::project { 'dynsatis':
    ensure  => 'latest',
    target  => $project_path,
    dev     => $devmode,
    lock    => true,
    require => [Class['::dynsatis::project'], Class['::dynsatis::composer::install']],
  }
}