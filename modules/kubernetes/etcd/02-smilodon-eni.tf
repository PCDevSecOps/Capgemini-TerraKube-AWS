## Etcd ENI Interfaces
resource "aws_network_interface" "etcd_eni_az1" {
  count = "${var.asg_maxsize_az1}"

  private_ips       = ["${values(var.etcd_nodes_az1)}"]
  security_groups   = ["${var.security_group}"]
  source_dest_check = false
  subnet_id         = "${var.subnet_in_az1}"

  tags {
    Env     = "${var.environment}"
    Name    = "${var.environment}-etcd-data"
    NodeID  = "${count.index}"
    AZ      = "${var.az1}"
    Role    = "etcd-eni"
    Service = "etcd"
  }
  tags = {
    yor_trace = "db898c43-0e31-4ec8-a31f-5a287786ee79"
  }
}

## Etcd ENI Interfaces
resource "aws_network_interface" "etcd_eni_az2" {
  count = "${var.asg_maxsize_az2}"

  private_ips       = ["${values(var.etcd_nodes_az2)}"]
  security_groups   = ["${var.security_group}"]
  source_dest_check = false
  subnet_id         = "${var.subnet_in_az2}"

  tags {
    Env     = "${var.environment}"
    Name    = "${var.environment}-etcd-data"
    NodeID  = "${count.index + aws_network_interface.etcd_eni_az1.count}"
    AZ      = "${var.az2}"
    Role    = "etcd-eni"
    Service = "etcd"
  }
  tags = {
    yor_trace = "e7e31edb-b62b-445e-b57d-74029ae50711"
  }
}

## Etcd ENI Interfaces
resource "aws_network_interface" "etcd_eni_az3" {
  count = "${var.asg_maxsize_az3}"

  private_ips       = ["${values(var.etcd_nodes_az3)}"]
  security_groups   = ["${var.security_group}"]
  source_dest_check = false
  subnet_id         = "${var.subnet_in_az3}"

  tags {
    Env     = "${var.environment}"
    Name    = "${var.environment}-etcd-data"
    NodeID  = "${count.index + aws_network_interface.etcd_eni_az1.count + aws_network_interface.etcd_eni_az2.count}"
    AZ      = "${var.az3}"
    Role    = "etcd-eni"
    Service = "etcd"
  }
  tags = {
    yor_trace = "8c8601a9-fc2a-41cf-8a37-571bb3ec8003"
  }
}
