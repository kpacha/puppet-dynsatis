class dynsatis::php(
  $devmode
){

  include ::php

  class { '::php::apache': }

  if ($devmode) {
    file{ '/var/www/phpinfo.php':
      content => '<?php echo phpinfo(); ?>',
      owner => 'www-data',
      group => 'www-data',
      mode => 0664
    }
  }

}