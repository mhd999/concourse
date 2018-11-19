resource "aws_s3_bucket" "b" {
  bucket = "${var.V1}"
  acl    = "private"

  tags {
    Name        = "${var.V2}"
    Environment = "${var.V3}"
  }
}