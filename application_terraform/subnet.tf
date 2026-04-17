resource "aws_subnet" "main-public-subnet-a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_public_a
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-subnet-a"
  }
}

resource "aws_subnet" "main-private-subnet-a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_private_a
  availability_zone = "ap-south-1a"
  tags = {
    Name = "${var.project_name}-private-subnet-a"
  }
}

resource "aws_subnet" "main-private-data-subnet-a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_private_data_a
  availability_zone = "ap-south-1a"
  tags = {
    Name = "${var.project_name}-private-data-subnet-a"
  }
}

resource "aws_subnet" "main-public-subnet-b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_public_b
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-subnet-b"
  }
}

resource "aws_subnet" "main-private-subnet-b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_private_b
  availability_zone = "ap-south-1b"
  tags = {
    Name = "${var.project_name}-private-subnet-b"
  }
}

resource "aws_subnet" "main-private-data-subnet-b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_private_data_b
  availability_zone = "ap-south-1b"
  tags = {
    Name = "${var.project_name}-private-data-subnet-b"
  }
}
