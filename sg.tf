

# create a security groups

resource "aws_security_group" "Ansible_ssh" {
   name = "SSH"
   description = " Allow SSH inbound rules " 
   vpc_id = aws_vpc.ansbile_vpc.id

   ingress  {
      description = "all shh"
      from_port = 22
      to_port = 22
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
     Name = "SSH"
   }
}

