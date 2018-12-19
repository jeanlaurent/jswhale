workflow "Deploy jshwale" {
  on = "push"
  resolves = [
    "Push to Hub",
    "PIng On Slack",
  ]
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

action "Docker pull" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Push to Hub"]
  args = "pull jeanlaurent/slackclient"
}

action "PIng On Slack" {
  uses = "docker://jeanlaurent/slackclient"
  needs = ["Docker pull"]
  args = "slack jeanlaurent/jswhale pushed to hub via github actions"
  secrets = ["SLACK_WEBHOOK"]
}
