def ze [...params] {
  zellij edit $params
}

def zef [...params] {
  zellij edit --floating $params
}

def zr [...params] {
  zellij run --name $params -- bash -ic $params
}

def zrf [...params] {
  zellij run --floating --name $params -- bash -ic $params
}
