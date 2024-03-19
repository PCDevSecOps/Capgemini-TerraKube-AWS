resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name              = "TerraKubeVPC"
    KubernetesCluster = "${var.name}"
    yor_trace         = "b720ebe9-6b50-40fa-884a-4ddc7a530cd6"
  }
}

#Internet gateway for public access/internet access
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name              = "TerraKubeInternetGateway"
    KubernetesCluster = "${var.name}"
  }
  tags = {
    yor_trace = "e4e9f8ec-bc85-4207-af50-497a880a7837"
  }
}

# Create Elastic IPs for the natgateways
resource "aws_eip" "nat1" {
  vpc        = true
  depends_on = ["aws_internet_gateway.internet-gateway"]
  tags = {
    yor_trace = "678f07d9-096d-44f8-b963-a89523d30453"
  }
}

resource "aws_eip" "nat2" {
  vpc        = true
  depends_on = ["aws_internet_gateway.internet-gateway"]
  tags = {
    yor_trace = "748344dc-fe80-4cda-a2b4-91ee5c28dc8c"
  }
}

resource "aws_eip" "nat3" {
  vpc        = true
  depends_on = ["aws_internet_gateway.internet-gateway"]
  tags = {
    yor_trace = "f84fc527-87ff-4cb7-b71d-12ddc8d8df10"
  }
}

#Create NAT gateways for each AZ and it will depend on the internet gateway creation
resource "aws_nat_gateway" "nat1" {
  allocation_id = "${aws_eip.nat1.id}"
  subnet_id     = "${aws_subnet.public1.id}"
  depends_on    = ["aws_internet_gateway.internet-gateway"]
  tags = {
    yor_trace = "81d44a80-adaa-4eee-a7b6-a5d93eb77fcd"
  }
}

resource "aws_nat_gateway" "nat2" {
  allocation_id = "${aws_eip.nat2.id}"
  subnet_id     = "${aws_subnet.public2.id}"
  depends_on    = ["aws_internet_gateway.internet-gateway"]
  tags = {
    yor_trace = "652b8ed7-7062-4173-b5e2-041c11db9ef6"
  }
}

resource "aws_nat_gateway" "nat3" {
  allocation_id = "${aws_eip.nat3.id}"
  subnet_id     = "${aws_subnet.public3.id}"
  depends_on    = ["aws_internet_gateway.internet-gateway"]
  tags = {
    yor_trace = "ae97869b-c406-42c0-b335-97e8a217c0c7"
  }
}
