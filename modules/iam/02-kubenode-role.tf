#kubenode
resource "aws_iam_role" "worker_role" {
  name               = "${var.worker_role_name}"
  path               = "/"
  assume_role_policy = "${file("${path.module}/Files/worker-role.json")}"
  tags = {
    yor_trace = "0e1a6d3a-24d3-4a89-9834-8582d69b9954"
  }
}

data "template_file" "worker_policy" {
  template = "${file("${path.module}/Files/worker-policy.json")}"

  vars {
    kubebucket = "${var.kubebucket}"
    hostedzone = "${var.hostedzone}"
  }
}

resource "aws_iam_role_policy" "worker_policy" {
  name   = "worker_policy"
  role   = "${aws_iam_role.worker_role.id}"
  policy = "${data.template_file.worker_policy.rendered}"
}

resource "aws_iam_instance_profile" "worker_profile" {
  depends_on = ["aws_iam_role.worker_role", "aws_iam_role_policy.worker_policy"]
  name       = "worker_profile"
  role       = "${aws_iam_role.worker_role.name}"
  tags = {
    yor_trace = "eb69d136-38ae-4923-b607-f122dc9cb5e1"
  }
}
