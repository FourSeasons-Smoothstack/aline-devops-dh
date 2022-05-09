resource "aws_ecs_cluster" "aline-banking-cluster-dh" {
  name = "AlineBankingClusterDH"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
