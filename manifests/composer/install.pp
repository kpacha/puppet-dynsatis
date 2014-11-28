class dynsatis::composer::install(
  $target_dir
){
	file{ $target_dir:
	  ensure => 'directory',
	  owner => 'www-data',
	  group => 'www-data',
	  mode => 0775
	}

	class { '::composer':
	  provider    => 'wget',
	  auto_update => false,
      user        => 'www-data',
      target_dir  => $target_dir,
	  require     => [Class['::dynsatis::php'], FIle[$target_dir]],
	}
}