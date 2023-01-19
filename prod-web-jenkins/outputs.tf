output "public_ip_associate" {
    value = module.ec2_jenkins.public_ip_associate
  
}
output "public_ip" {
    value = module.ec2_jenkins.public_ip
  
}
output "sg_id" {
    value = module.ec2_jenkins.sg_id
  
}