variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
variable "iam_role_arn" {
  type = string
}

resource "aws_redshift_subnet_group" "subnet_group" {
  name       = "redshift-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_redshift_cluster" "this" {
  cluster_identifier       = "my-redshift-cluster"
  node_type                = "dc2.large"
  master_username          = "adminuser"
  master_password          = "RedshiftPass123!"
  cluster_type             = "single-node"
  cluster_subnet_group_name = aws_redshift_subnet_group.subnet_group.name
  vpc_security_group_ids   = var.security_group_ids
  iam_roles                = [var.iam_role_arn]
  publicly_accessible      = false
  encrypted                = true
  skip_final_snapshot      = true
}
