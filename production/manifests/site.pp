node "default" {
  include config
  include base
}

node /dev(1|2).salas4linux.com.br/ {
  include docker
}

node ubuntu2.salas4linux.com.br {
  include nginx
}

