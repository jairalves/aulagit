class httpd {

  case $::osfamily {
    'redhat':{
      $pacotes = ["httpd", "php"]
      $httpd = "httpd"
    }
    'debian':{
      $pacotes = ["apache2", "php", "libapache2-mod-php"]
      $httpd = "apache2"
    }
  }
  
  package {$pacotes:
    ensure => present,
    before => File["/var/www/html/index.php"]
  }

  ->
  
#  exec { "a2enmod":
#    command => "/usr/sbin/a2enmod php7.0"
#  }

#  file { "/var/www/html/index.php":
#    content => "<?php echo 'puppet server e agent funcionando'; ?>",
#  }
  
  file { "/var/www/html/index.php":
    source => "puppet:///modules/httpd/index.php",
    ensure => present,
  }

  ->
  
  service {$httpd:
    ensure => "running",
  }

}


