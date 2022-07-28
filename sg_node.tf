

# create a security groups

resource "aws_security_group" "Ansible_NODES_sg" {
   name = "SSH & httpd"
   description = " Allow SSH  & httpd inbound rules " 
   vpc_id = aws_vpc.ansbile_vpc.id

   ingress  {
      description = "allow ssh"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks= [ "0.0.0.0/0" ]   
 }
   ingress  {
      description = "allow httpd"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks= [ "0.0.0.0/0" ]   

 } 
   egress  {
     description = "all traffic"
     from_port = 0
     protocol = "-1"
     to_port = 0
     cidr_blocks = [ "0.0.0.0/0" ] 
 }
   tags = {
     Name = "Allow SSH & HTTPD"
   }
}

