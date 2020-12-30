provider "helm" {
 
 kubernetes {
    config_path = "../kubeconfig_gitlab-test-eks"
 } 

}

resource "helm_release" "gitlab" {

  name      = "${var.target_namespace}--gitlab"
  namespace = var.target_namespace
  chart     = "gitlab/gitlab"

  set {
    name  = "timeout"
    value = "600s"
  }

  set {
    name = "global.hosts.domain"
    value = var.gitlab_domain
  }


  set {
    name = "certmanager-issuer.email"
    value = var.certmanager_issuer_email
  }


}
