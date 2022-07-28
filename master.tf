
# create ec2 instance

resource "aws_instance" "Master" {
    ami = "ami-0a5588cee1fe39fff"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.ansible_public_sn.id
    key_name = "KeyName"
    private_ip = "10.0.0.100"
    vpc_security_group_ids = [ aws_security_group.Ansible_ssh.id ]
    user_data = file("user_data.sh")

    tags = {
      Name = "Master"
    }
}
