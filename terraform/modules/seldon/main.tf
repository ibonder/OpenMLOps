provider "helm" {}


resource "helm_release" "seldon" {
  name      = "seldon-core"
  namespace = var.namespace


  repository = "https://storage.googleapis.com/seldon-charts"
  chart      = "seldon-core-operator"

  set {
    name  = "istio.enabled"
    value = var.istio_enabled
  }

  set {
    name  = "usageMetrics.enabled"
    value = var.usage_metrics_enabled
  }
}