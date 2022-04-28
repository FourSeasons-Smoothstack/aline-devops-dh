resource "aws_ecs_cluster" "aline-banking-cluster-dh" {
  name = "Aline Banking Cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
