# Create VPC 
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Allocate Elastic IP for NAT Gateway A
resource "aws_eip" "nat-a" {
  domain = "vpc"
}

# Allocate Elastic IP for NAT Gateway B
resource "aws_eip" "nat-b" {
  domain = "vpc"
}

# Create NAT Gateway for public-a
resource "aws_nat_gateway" "main-public-nat-gateway-a" {
  allocation_id = aws_eip.nat-a.id
  subnet_id     = aws_subnet.main-public-subnet-a.id
  tags = {
    Name = "${var.project_name}-public-nat-gateway-a"
  }
}

# Create NAT Gateway for public-b
resource "aws_nat_gateway" "main-public-nat-gateway-b" {
  allocation_id = aws_eip.nat-b.id
  subnet_id     = aws_subnet.main-public-subnet-b.id
  tags = {
    Name = "${var.project_name}-public-nat-gateway-b"
  }
}

# Create Route Table
# Create Public Route Table
resource "aws_route_table" "main-public-route-table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "${var.project_name}-public-route-table"
  }
}

# Create Private Zone-a Route Table
resource "aws_route_table" "main-private-route-table-a" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main-public-nat-gateway-a.id
  }
  tags = {
    Name = "${var.project_name}-private-route-table-a"
  }
}

# Private Zone-b Route Table
resource "aws_route_table" "main-private-route-table-b" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main-public-nat-gateway-b.id
  }
  tags = {
    Name = "${var.project_name}-private-route-table-b"
  }
}

# Create Route Table Association
# Create Public Route Table Association for subnet-a
resource "aws_route_table_association" "main-public-route-table-association-a" {
  subnet_id      = aws_subnet.main-public-subnet-a.id
  route_table_id = aws_route_table.main-public-route-table.id
}

# Create Public Route Table Association for subnet-b
resource "aws_route_table_association" "main-public-route-table-association-b" {
  subnet_id      = aws_subnet.main-public-subnet-b.id
  route_table_id = aws_route_table.main-public-route-table.id
}

# Create Private Zone-a Route Table Association for subnet-a, data-subnet-a
resource "aws_route_table_association" "main-private-route-table-association-a" {
  count          = 2
  subnet_id      = [aws_subnet.main-private-subnet-a.id, aws_subnet.main-private-data-subnet-a.id][count.index]
  route_table_id = aws_route_table.main-private-route-table-a.id
}

# # Create Private Zone-a Route Table Association for data-subnet-a
# resource "aws_route_table_association" "main-private-data-route-table-association-a" {
#   subnet_id      = aws_subnet.main-private-data-subnet-a.id
#   route_table_id = aws_route_table.main-private-route-table-a.id
# }

# Create Private Zone-b Route Table Association for subnet-b, data-subnet-b
resource "aws_route_table_association" "main-private-route-table-association-b" {
  count          = 2
  subnet_id      = [aws_subnet.main-private-subnet-b.id, aws_subnet.main-private-data-subnet-b.id][count.index]
  route_table_id = aws_route_table.main-private-route-table-b.id
}

# # Create Private Zone-b Route Table Association for data-subnet-b
# resource "aws_route_table_association" "main-private-data-route-table-association-b" {
#   subnet_id      = aws_subnet.main-private-data-subnet-b.id
#   route_table_id = aws_route_table.main-private-route-table-b.id
# }
