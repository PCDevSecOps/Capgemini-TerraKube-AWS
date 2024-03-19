# Create the public route tables
resource "aws_route_table" "public1_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name              = "TerraKube Public1 route table"
    KubernetesCluster = "${var.name}"
  }
  tags = {
    yor_trace = "3d3a7a53-6ff5-4df6-a436-0d76429c895d"
  }
}

resource "aws_route_table" "public2_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name              = "TerraKube Public2 route table"
    KubernetesCluster = "${var.name}"
  }
  tags = {
    yor_trace = "f8a489a1-df5b-40cb-b4f2-41388ca5955a"
  }
}

resource "aws_route_table" "public3_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name              = "TerraKube Public3 route table"
    KubernetesCluster = "${var.name}"
  }
  tags = {
    yor_trace = "2f1e123c-4dba-4ebc-850f-2b1bd9c9d66a"
  }
}

#Create public routes - links to internet gateway for internet access
resource "aws_route" "public1_route" {
  route_table_id         = "${aws_route_table.public1_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet-gateway.id}"
}

resource "aws_route" "public2_route" {
  route_table_id         = "${aws_route_table.public2_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet-gateway.id}"
}

resource "aws_route" "public3_route" {
  route_table_id         = "${aws_route_table.public3_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet-gateway.id}"
}

# Create the private route tables
resource "aws_route_table" "private1_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name              = "TerraKube Private1 route table"
    KubernetesCluster = "${var.name}"
  }
  tags = {
    yor_trace = "9d89ab59-0996-4f42-a71d-54b6fce1dd21"
  }
}

resource "aws_route_table" "private2_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name              = "TerraKube Private2 route table"
    KubernetesCluster = "${var.name}"
  }
  tags = {
    yor_trace = "daea470c-aa56-49a3-8e98-48775999fc18"
  }
}

resource "aws_route_table" "private3_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name              = "TerraKube Private3 route table"
    KubernetesCluster = "${var.name}"
  }
  tags = {
    yor_trace = "3a67e5b2-8dc6-4ebd-87d8-c50ebdba1c4c"
  }
}

# Create private routes - links to NAT gateway for 1 way internet access
resource "aws_route" "private1_route" {
  route_table_id         = "${aws_route_table.private1_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat1.id}"
}

resource "aws_route" "private2_route" {
  route_table_id         = "${aws_route_table.private2_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat2.id}"
}

resource "aws_route" "private3_route" {
  route_table_id         = "${aws_route_table.private3_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat3.id}"
}
