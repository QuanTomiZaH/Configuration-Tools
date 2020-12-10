# aws_volume_attachment
# aws_s3_bucket
# aws_ebs_volume
# aws_efs_file_system
# aws_efs_mount_target
# aws_cloudformation_stack
# aws s3 buckets
# AWS s3 bucket
resource "aws_s3_bucket" "main" {
  bucket = "<bucket-name>"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = {
    Name         = "<bucket-name>"
    environment  = "${var.stack-env}"
    stack-number = "${var.stack-number}"
    stack-name   = "${var.stack-name}"
    app-number   = "${var.app-number}"
  }
}
