# TERRAFORM CREATE VPC FOR ANSIBLE TO CONFIGURE
resource "aws_vpc" "ansbile_vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "Ansible vpc"
    }
}

# internet gateway to vpc

resource "aws_internet_gateway" "ansible_igw" {
    vpc_id = aws_vpc.ansbile_vpc.id
    tags = {
        Name = "ansible-igw"
    }  
}

# create a public subnet to ansible vpc

resource "aws_subnet" "ansible_public_sn" {
    vpc_id = aws_vpc.ansbile_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-2a"

    tags = {
        Name = "ansible_public_sn"
    }  
}

# create a private subnet to ansible vpc

resource "aws_subnet" "ansible_private_sn" {
    vpc_id = aws_vpc.ansbile_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2a"

    tags = {
        Name = "ansible_private_sn"
    }
}



# create a route table 

resource "aws_route_table" "ansible_public_rt" {
    vpc_id = aws_vpc.ansbile_vpc.id
    route  {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.ansible_igw.id
      
    } 
    tags = {
      Name = "ansible_public_rt"
    }
}


# create a private route table

resource "aws_route_table" "ansible_private_rt" {
    vpc_id = aws_vpc.ansbile_vpc.id
    tags = {
      Name = "ansible_private_rt"
    }
  
}

# create a public route associate 

resource "aws_route_table_association" "public_rt_associate" {
    subnet_id = aws_subnet.ansible_public_sn.id
    route_table_id = aws_route_table.ansible_public_rt.id
}

# create a private route subnet association

resource "aws_route_table_association" "private_rt_associate" {
    subnet_id = aws_subnet.ansible_private_sn.id
    route_table_id = aws_route_table.ansible_private_rt.id 
}



