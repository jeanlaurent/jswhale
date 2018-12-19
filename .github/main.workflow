workflow "New workflow" {
  on = "push"
  resolves = ["docker://jeanlaurent/slackclient"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@76ff57a"
  args = "build -t jeanlaurent/jswhale ."
}

action "Docker Registry" {
  uses = "actions/docker/login@76ff57a"
  needs = ["GitHub Action for Docker"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "GitHub Action for Docker-1" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "push jeanlaurent/jswhale"
}

action "docker://jeanlaurent/slackclient" {
  uses = "docker://jeanlaurent/slackclient"
  needs = ["GitHub Action for Docker-1"]
  secrets = ["SLACK_WEBHOOK"]
  runs = "slack"
}
