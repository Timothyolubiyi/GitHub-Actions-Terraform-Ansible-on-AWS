resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_subnet" "pub_sub_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.avail_zone

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "pub_sub_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.avail_zone

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "pub_sub_3" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = var.avail_zone

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-3"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "pub_sub_1_assoc" {
  subnet_id      = aws_subnet.pub_sub_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "pub_sub_2_assoc" {
  subnet_id      = aws_subnet.pub_sub_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "pub_sub_3_assoc" {
  subnet_id      = aws_subnet.pub_sub_3.id
  route_table_id = aws_route_table.public_rt.id
}
