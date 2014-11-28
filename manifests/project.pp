class dynsatis::project(
  $project_path
){
	vcsrepo { $project_path:
	  ensure   => 'latest',
	  provider => 'git',
	  source   => 'https://github.com/kpacha/dynsatis.git',
	  revision => 'master',
	}
}