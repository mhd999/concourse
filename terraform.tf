resource "aws_s3_bucket" "b" {
  bucket = "${var.TF_VAR_V1}"
  acl    = "private"

  tags {
    Name        = "${var.TF_VAR_V2}"
    Environment = "${var.TF_VAR_V3}"
  }
}