module "vpn_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops_ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  #this is optional, if we dont give this will be provisioned inside default subnet of default vpc
  #subnet_id = local.public_subnet_ids[0] # public subnet of default VPC
  tags = merge(
    {
        Name = "${var.project_name}-${var.env}-vpn"
    },
    var.common_tags
  )
}