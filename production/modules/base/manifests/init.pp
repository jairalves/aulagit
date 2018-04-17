class base {

  $pacotes = ["vim", "systat", "htop", "telnet", "iotop", "nmom", "netcat", "nmap"]

  package {$pacotes:
    ensure => present,
  }
 
}
