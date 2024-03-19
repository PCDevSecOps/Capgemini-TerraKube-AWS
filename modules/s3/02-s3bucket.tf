resource "aws_kms_key" "kubekms" {
  depends_on              = ["null_resource.roledependency", "data.template_file.kmspolicy"]
  description             = "KMS key 1"
  deletion_window_in_days = 7
  policy                  = "${data.template_file.kmspolicy.rendered}"
  tags = {
    yor_trace = "89cc8f08-6cee-46cc-957a-d101ca33e2dd"
  }
}

resource "aws_s3_bucket" "kubebucket" {
  depends_on = ["aws_kms_key.kubekms"]

  bucket = "${var.bucketname}"
  acl    = "private"

  tags {
    Name              = "Kubebucket"
    Environment       = "Dev"
    KubernetesCluster = "${var.name}"
  }
  tags = {
    yor_trace = "4c07542c-9dab-465e-9bd1-c277788f779a"
  }
}
