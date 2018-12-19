workflow "Deploy jshwale" {
  on = "push"
  resolves = ["Slack Ping"]
}

action "Build jswhale" {
  uses = "actions/docker/cli@76ff57a"
  args = "build -t jeanlaurent/jswhale ."
}

action "Login to Docker Registry" {
  uses = "actions/docker/login@76ff57a"
  needs = ["Build jswhale"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Push to Hub" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Login to Docker Registry"]
  args = "push jeanlaurent/jswhale"
}

action "Slack Ping" {
  uses = "docker://jeanlaurent/slackclient"
  needs = ["Push to Hub"]
  secrets = ["SLACK_WEBHOOK"]
  args = "slack jeanlaurent/jswhale pushed to hub via github actions"
}
