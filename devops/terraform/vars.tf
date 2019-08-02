# variables for project

variable "project_id" {
  default = ""
}

variable "billing_account_id" {
  default = "yyyyyyyyyyyyyyyyyyyyyyyyyy"
}

variable "environment" {
  default = "prod"
}

variable "project_name" {
  default = ""
}

variable "cluster_name" {
  default = "timeoff-cluster"
}

variable "network" {    # Cluster shared network
  default = "shared-net"
}

variable "subnetwork" {   # Cluster subnet varies between envs
  default = "k8-nodes"
}

variable "pool_name" {
  default = "timeoff-node-pool"
}

variable "description" {
  default = "timeoff"
}

variable "apis" {
  default = ["bigquery-json.googleapis.com",
    "pubsub.googleapis.com",
    "cloudfunctions.googleapis.com",
    "dataflow.googleapis.com",
    "sqladmin.googleapis.com",
    "container.googleapis.com",
  ]
}

variable "machine_type" {
  default = "n1-standard-4"
} # cluster machine_type
