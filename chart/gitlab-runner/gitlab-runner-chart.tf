provider "helm" {
 
 kubernetes {
    config_path = "../../kubeconfig_gitlab-test-eks"
 } 

}

resource "helm_release" "gitlab-runner" {

  name      = "${var.target_namespace}--docker-gitlab-runner"
  namespace = var.target_namespace
  chart     = "gitlab/gitlab-runner"


  set {
    name = "gitlabUrl"
    value = "https://gitlab.test.com/"
  }

  set {
    name = "runnerRegistrationToken"
    value = "kdNYy5fHPxP6Wotq3HdC"
  }


  set {
    name = "runners.privileged"
    value = true
  }



}
