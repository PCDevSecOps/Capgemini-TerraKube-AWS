# AWS Keypair for SSH
resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
  tags = {
    yor_trace = "17a1e60f-db02-43ae-afcc-20a8bc22198b"
  }
}
