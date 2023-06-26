# VPC
resource "aws_vpc" "devops_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "devops-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "devops_igw" {
  vpc_id = aws_vpc.devops_vpc.id
  tags = {
    Name = "devops-igw"
  }
}

# Subnets : public
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.devops_vpc.id
  cidr_block              = var.public_subnets_cidr
  availability_zone       = var.azs
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

# Subnets : private
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = var.private_subnets_cidr
  availability_zone = var.azs
  tags = {
    Name = "private-subnet"
  }
}

# Route table: attach Internet Gateway 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.devops_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_igw.id
  }
  tags = {
    Name = "devops-public-rt"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "public-associate" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.devops_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "devops-private-rt"
  }
}


resource "aws_eip" "nat_gateway_ip" {
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_ip.id
  subnet_id     = aws_subnet.public.id
  tags = {
    "Name" = "nat-gateway"
  }
}

# Route table association with private subnet
resource "aws_route_table_association" "private-associate" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}
