workflow "New workflow" {
  on = "push"
  resolves = ["Docker Registry"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@76ff57a"
  runs = "run -t . jeanlaurent/jswhale"
}

action "Docker Registry" {
  uses = "actions/docker/login@76ff57a"
  needs = ["GitHub Action for Docker"]
}
