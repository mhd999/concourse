resource "aws_s3_bucket" "b" {
  bucket = "whatevershbalala"
  acl    = "private"

  tags {
    Name        = "${var.foo}"
    Environment = "${var.bar}"
  }
}