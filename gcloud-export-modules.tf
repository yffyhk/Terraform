provider "google" {
  project = "k8slab-316013"
}


module "gcp" {
  source = "./gcp"
}

