resource "aws_vpc" "terraform-vpc"{
    cidr_block = "10.0.0.0/16" 
    tags = {
    Name = "terraform-demo-vpc"
  }
}

resource "aws_internet_gateway" "terraform-igw"{
    vpc_id = aws_vpc.terraform-vpc.id
    tags = {
        Name = "Terraform internet gateway"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.terraform-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.terraform-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1a" 
}

resource "aws_route_table" "terraform-rt"{
    vpc_id = aws_vpc.terraform-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terraform-igw.id
    }
    tags = {
        Name = "Terraform Route Table for peering"
    }
}

resource "aws_route_table_association" "public-subnet-association" {
    subnet_id   =   aws_subnet.public_subnet.id
    route_table_id  =   aws_route_table.terraform-rt.id
}