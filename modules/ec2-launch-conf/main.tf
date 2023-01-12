resource "aws_instance" "ec2" {
  ami = var.ami_name
  # "ami-0ab04b3ccbadfae1f"
  instance_type = var.instance_type
  # "t2.micro"

  tags = {
    Name = "${var.tag_name}"
  }

  network_interface {
    network_interface_id = aws_network_interface.eni.id
    device_index         = 0
    # delete_on_termination = true
    
    # security_groups = var.sg_list
    
  }
  
  key_name = var.key_name

  user_data = var.user_data

  # lifecycle{
  #       create_before_destroy = true
  # } #생성 후 삭제
}

