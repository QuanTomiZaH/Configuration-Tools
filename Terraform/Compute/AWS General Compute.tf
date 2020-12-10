##aws_instance
### AWS WINDOWS INSTANCES INCLUDE THIS IN EVERY RESOURCE TO ALLOW ANSIBLE RUNS ###
##user_data = "${data.template_file.aws_winrm.rendered}"
##
#AWS hosts
resource "aws_instance" "fs01" {
  ami                    = "${data.aws_ami.windows2019-base.id}"
  availability_zone      = "${var.aws-az1}"
  subnet_id              = "${var.services-subnet-a}"
  key_name               = "${var.aws-svc-key-name}"
  vpc_security_group_ids = ["${module.aws_base_security_group.aws_base_security_group_id}"]

  tags = {
    Name                = "fs01"
    environment         = "${var.stack-env}"
    stack-number        = "${var.stack-number}"
    stack-name          = "${var.stack-name}"
    app-number          = "${var.app-number}"
    os-version          = "windows2019"
    os-type             = "windows"

    #Onderstaande role kan worden gebruikt in AWX voor deployen Ansible playbooks
    fileserver-role = "standardfileserver"
  }

  #volume op de vm
  root_block_device = {
    volume_type = "gp2"
    volume_size = "128"
  }

  #Type binnen AWS
  instance_type = "t3a.large"

  #Kostenspecificatie
  credit_specification = {
    cpu_credits = "unlimited"
  }

  lifecycle = {
    ignore_changes = [
      "ami",
      "user_data",
    ]
  }

  source_dest_check = true
  user_data         = "${data.template_file.aws_winrm.rendered}"
}
