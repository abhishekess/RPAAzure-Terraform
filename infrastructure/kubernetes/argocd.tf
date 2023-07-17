resource "kubernetes_namespace" "argocd_namespace" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.39.0"
  namespace  = "argocd"

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  depends_on = [kubernetes_namespace.argocd_namespace]
}

# resource "argocd_application" "argocd_config" {
#   metadata {
#     name      = "${var.context}-${var.stage}"
#     namespace = "argocd"
#     labels = {
#       test = "true"
#     }
#   }

#   cascade = false # disable cascading deletion
#   wait    = true

#   spec {
#     project = "${var.context}"

#     destination {
#       server    = "https://kubernetes.default.svc"
#       namespace = "${var.stage}"
#     }

#     source {
#       repo_url        = "https://github.com/abhishekess/RPAAzure-Infrastructure"
#       path            = "overlays/${var.stage}"
#       target_revision = "master"
#       kustomize {
#         images      = ["abhishekess/RPAAzure:v1"]
#       }
#     }

#     sync_policy {
#       automated {
#         prune       = true
#         self_heal   = true
#         allow_empty = true
#       }
#       # Only available from ArgoCD 1.5.0 onwards
#       sync_options = ["Validate=false"]
#       retry {
#         limit = "5"
#         backoff {
#           duration     = "30s"
#           max_duration = "2m"
#           factor       = "2"
#         }
#       }
#     }
#   }

#   depends_on = [helm_release.argocd]
# }
