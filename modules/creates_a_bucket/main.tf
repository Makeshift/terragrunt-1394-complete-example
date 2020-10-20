# Creates a bucket and puts a file into it so deletion will fail

variable "vpc_name" {
    type = string
    description = "This module requires a VPC name for some reason"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket_prefix = var.vpc_name
  acl    = "private"
}

resource "local_file" "foo" {
    content = "foo"
    filename = "${path.module}/foo.bar"
}

# aws_s3_bucket_object would correctly delete the file,
#  so I'm just uploading it with aws cli here
resource "null_resource" "upload_to_s3" {
  provisioner "local-exec" {
    command = "aws s3 cp ${path.module}/foo.bar s3://${aws_s3_bucket.test_bucket.id}/foo.bar"
  }
  depends_on = [local_file.foo]
}

output "bucket" {
    value = aws_s3_bucket.test_bucket.id
}