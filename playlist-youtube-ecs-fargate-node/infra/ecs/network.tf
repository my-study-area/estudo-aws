# VPC
resource "aws_vpc" "fna-vpc" {
  cidr_block       = "10.0.0.0/21"
  instance_tenancy = "default"

  tags = {
    Name = "fna-vpc"
  }
}

# Subnets
resource "aws_subnet" "fna-public-a" {
  vpc_id            = aws_vpc.fna-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "fna-public-a"
  }
}

resource "aws_subnet" "fna-public-b" {
  vpc_id            = aws_vpc.fna-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "fna-public-b"
  }
}

resource "aws_subnet" "fna-private-a" {
  vpc_id            = aws_vpc.fna-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "fna-private-a"
  }
}

resource "aws_subnet" "fna-private-b" {
  vpc_id            = aws_vpc.fna-vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "fna-private-b"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "fna-igw" {
  vpc_id = aws_vpc.fna-vpc.id
  tags = {
    Name = "fna-igw"
  }
}

# NAT Gateways com alocação de ip
resource "aws_eip" "fna-ei-a" {
  domain = "vpc"
}

resource "aws_eip" "fna-ei-b" {
  domain = "vpc"
}

resource "aws_nat_gateway" "fna-nat-gw-a" {
  subnet_id     = aws_subnet.fna-private-a.id
  allocation_id = aws_eip.fna-ei-a.id
}

resource "aws_nat_gateway" "fna-nat-gw-b" {
  subnet_id     = aws_subnet.fna-private-b.id
  allocation_id = aws_eip.fna-ei-b.id
}

# Route Tables publica
resource "aws_route_table" "fna-public-rt" {
  vpc_id = aws_vpc.fna-vpc.id

  tags = {
    Name = "fna-public-rt"
  }
}

# adiciona rota para internet gateway
resource "aws_route" "fna-public-rt-route" {
  route_table_id = aws_route_table.fna-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.fna-igw.id
}

## associa subnets publica A na route table publica
resource "aws_route_table_association" "fna-rta-public-subnet-a" {
  route_table_id = aws_route_table.fna-public-rt.id
  subnet_id      = aws_subnet.fna-public-a.id
}

## associa subnets publica B na route table publica
resource "aws_route_table_association" "fna-rta-public-subnet-b" {
  route_table_id = aws_route_table.fna-public-rt.id
  subnet_id      = aws_subnet.fna-public-b.id
}

# Route Tables privada A
resource "aws_route_table" "fna-private-a-rt" {
  vpc_id = aws_vpc.fna-vpc.id
  
  tags = {
    Name = "fna-private-a-rt"
  }
}

# adiciona rota para NAT Gateway A
resource "aws_route" "fna-private-a-rt-route" {
  route_table_id = aws_route_table.fna-private-a-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.fna-nat-gw-a.id
}

# associa subnets privada A na route table privada A
resource "aws_route_table_association" "fna-rta-private-subnet-a" {
  route_table_id = aws_route_table.fna-private-a-rt.id
  subnet_id      = aws_subnet.fna-private-a.id
}

# Route Tables privada B
resource "aws_route_table" "fna-private-b-rt" {
  vpc_id = aws_vpc.fna-vpc.id
  
  tags = {
    Name = "fna-private-b-rt"
  }
}

# adiciona rota para NAT Gateway B
resource "aws_route" "fna-private-b-rt-route" {
  route_table_id = aws_route_table.fna-private-b-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.fna-nat-gw-b.id
}

# associa subnets privada B na route table privada B
resource "aws_route_table_association" "fna-rta-private-subnet-b" {
  route_table_id = aws_route_table.fna-private-b-rt.id
  subnet_id      = aws_subnet.fna-private-b.id
}

