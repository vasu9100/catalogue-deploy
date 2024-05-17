locals {
  name = "catalogue-listner"
  private_subnet_id = element(split(",", data.aws_ssm_parameter.private_subnet_ssm.value), 0)
  current_time = formatdate("YYYY-MM-DD-hh-mm", timestamp())
}