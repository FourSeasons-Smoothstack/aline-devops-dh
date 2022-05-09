resource "aws_db_instance" "alinedbdh" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "aline-db-dh"
  username             = "admin"
  password             = "$$$$change-me$$$$$"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}