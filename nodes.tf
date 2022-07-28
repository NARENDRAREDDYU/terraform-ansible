
# create ansible worker ec2 instances

resource "aws_instance" "Node1" {
    ami = "ami-0a5588cee1fe39fff"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.ansible_public_sn.id
    key_name = "KeyName"
    private_ip = "10.0.0.101"
    vpc_security_group_ids = [ aws_security_group.Ansible_NODES_sg.id ]
    

    tags = {
      Name = "Node1"
    }
}


resource "aws_instance" "Node2" {
    ami = "ami-0a5588cee1fe39fff"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.ansible_public_sn.id
    key_name = "KeyName"
    private_ip = "10.0.0.102"
    vpc_security_group_ids = [ aws_security_group.Ansible_NODES_sg.id ]
    

    tags = {
      Name = "Node2"
    }
}
