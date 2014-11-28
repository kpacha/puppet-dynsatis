class dynsatis::composer(
  $target_dir   = '/var/lib/composer',
  $project_path,
  $devmode
){
    class{ '::dynsatis::composer::install':
      target_dir => $target_dir,
    }

    class{ '::dynsatis::composer::project':
      project_path => $project_path,
      devmode      => $devmode,
    }
}