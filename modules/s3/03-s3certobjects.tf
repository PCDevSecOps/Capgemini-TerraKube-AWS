resource "aws_s3_bucket_object" "capem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.capem}"
  source     = "${path.cwd}/Certs/${var.capem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "ddefd3d6-6912-4e5a-9121-85e6be4cb534"
  }
}

resource "aws_s3_bucket_object" "cakey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.cakey}"
  source     = "${path.cwd}/Certs/${var.cakey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "8a41483a-cd79-4ab5-ac39-d02c571e4a92"
  }
}

resource "aws_s3_bucket_object" "etcdpem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.etcdpem}"
  source     = "${path.cwd}/Certs/${var.etcdpem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "ca39a641-dad7-4643-80d2-9d5d374bfa56"
  }
}

resource "aws_s3_bucket_object" "etcdkey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.etcdkey}"
  source     = "${path.cwd}/Certs/${var.etcdkey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "3b48aad3-fa30-4161-86ce-f570618a2ab6"
  }
}

resource "aws_s3_bucket_object" "masterpem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.masterpem}"
  source     = "${path.cwd}/Certs/${var.masterpem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "4fd2cb7c-96ad-4235-8fbe-9d4e09059bb4"
  }
}

resource "aws_s3_bucket_object" "masterkey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.masterkey}"
  source     = "${path.cwd}/Certs/${var.masterkey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "4d7cd18f-0afe-40a2-baef-82e2525449d0"
  }
}

resource "aws_s3_bucket_object" "kubenodepem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.kubenodepem}"
  source     = "${path.cwd}/Certs/${var.kubenodepem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "90fd2976-1016-4e0c-9c8d-6d27cc415334"
  }
}

resource "aws_s3_bucket_object" "kubenodekey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.kubenodekey}"
  source     = "${path.cwd}/Certs/${var.kubenodekey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "053f6f1f-84aa-462a-93e9-154d10b18cab"
  }
}

resource "aws_s3_bucket_object" "adminpem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.adminpem}"
  source     = "${path.cwd}/Certs/${var.adminpem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "0cb689d3-2316-4085-8d70-7dbed936091e"
  }
}

resource "aws_s3_bucket_object" "adminkey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.adminkey}"
  source     = "${path.cwd}/Certs/${var.adminkey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "d6aafbbe-832d-449a-90f8-ef90d75c7c51"
  }
}

resource "aws_s3_bucket_object" "etcdproxypem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.etcdproxypem}"
  source     = "${path.cwd}/Certs/${var.etcdproxypem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "3da8dd38-f3ac-41db-abe2-5b55398064b1"
  }
}

resource "aws_s3_bucket_object" "etcdproxykey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.etcdproxykey}"
  source     = "${path.cwd}/Certs/${var.etcdproxykey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
  tags = {
    yor_trace = "a52e50e8-f853-47d6-a15a-8828b5f29173"
  }
}
