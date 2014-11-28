class dynsatis(
  $host,
  $devmode
){
  $project_path = '/var/www/dynsatis'

	::dynsatis::apache { $name:
      host         => $host,
      devmode      => $devmode,
      project_path => $project_path
	}

	class { '::dynsatis::php':
      devmode => $devmode
	}

	class { '::dynsatis::composer':
      devmode      => $devmode,
      project_path => $project_path
	}

	class { '::dynsatis::project':
      project_path => $project_path
	}
}
