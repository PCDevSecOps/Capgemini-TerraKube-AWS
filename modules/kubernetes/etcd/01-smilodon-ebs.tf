## Etcd EBS volumes
resource "aws_ebs_volume" "etcd_volumes_az1" {
  count = "${var.asg_maxsize_az1}"

  availability_zone = "${var.az1}"
  encrypted         = "${var.ebs_encrypted}"
  size              = "${var.ebs_size}"
  type              = "${var.ebs_type}"

  tags {
    Role              = "etcd-data"
    Env               = "${var.environment}"
    KubernetesCluster = "${var.name}"
    Name              = "${var.environment}-etcd-node${count.index}"
    NodeID            = "${count.index}"
    builtWith         = "terraform"
  }
  tags = {
    yor_trace = "34c5aa44-ca17-4882-8fbf-487acb6a8009"
  }
}

resource "aws_ebs_volume" "etcd_volumes_az2" {
  count = "${var.asg_maxsize_az2}"

  availability_zone = "${var.az2}"
  encrypted         = "${var.ebs_encrypted}"
  size              = "${var.ebs_size}"
  type              = "${var.ebs_type}"

  tags {
    Role              = "etcd-data"
    Env               = "${var.environment}"
    KubernetesCluster = "${var.name}"
    Name              = "${var.environment}-etcd-node${count.index}"
    NodeID            = "${count.index + aws_ebs_volume.etcd_volumes_az1.count}"
    builtWith         = "terraform"
  }
  tags = {
    yor_trace = "a5f9a4a6-5d18-4414-a511-8be9f4c66cca"
  }
}

resource "aws_ebs_volume" "etcd_volumes_az3" {
  count = "${var.asg_maxsize_az3}"

  availability_zone = "${var.az3}"
  encrypted         = "${var.ebs_encrypted}"
  size              = "${var.ebs_size}"
  type              = "${var.ebs_type}"

  tags {
    Role              = "etcd-data"
    Env               = "${var.environment}"
    KubernetesCluster = "${var.name}"
    Name              = "${var.environment}-etcd-node${count.index}"
    NodeID            = "${count.index + aws_ebs_volume.etcd_volumes_az1.count + aws_ebs_volume.etcd_volumes_az2.count}"
    builtWith         = "terraform"
  }
  tags = {
    yor_trace = "c2716d20-86f0-4387-b8d2-01f33198b35c"
  }
}
