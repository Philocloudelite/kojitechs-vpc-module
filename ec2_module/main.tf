
# locals {
#   #subnet_id = [aws_subnet.priv_sub[0].id, aws_subnet.priv_sub[1].id]
#   #Name      = ["app_instance_1", "app_instance_2"]

# }



# resource "aws_instance" "web" {
#  count      = var.instance_count ? 1 : 0
#   ami                    = var.ami
#   instance_type          = var.instance_type  
#   subnet_id              = var.subnet_id
#   #user_data              = file("${path.module}/template/app1-http.sh")
#   vpc_security_group_ids = var.vpc_security_group_ids 
#   iam_instance_profile   = var.iam_instance_prfile 
#   key_name               = var.key_name 

  

#   tags = {
#     Name = "web_instance"
#   }
# }


# /*
# resource "aws_instance" "registration_app" {
#   depends_on = [module.aurora]
#   count      = length(local.Name)

#   ami                    = data.aws_ami.amzlinux2.id
#   instance_type          = "t2.micro"
#   subnet_id              = var.subnet-id 
#   vpc_security_group_ids = [aws_security_group.app_sg.id]
#   iam_instance_profile   = aws_iam_instance_profile.instance_profile.name
#   key_name               = aws_key_pair.bastion_instance.id
#   user_data = templatefile("${path.root}/template/app3-ums-install.tmpl",
#     {
#       endpoint    = jsondecode(local.mysql.secret_string)["endpoint"]
#       port        = jsondecode(local.mysql.secret_string)["port"]
#       db_name     = jsondecode(local.mysql.secret_string)["dbname"]
#       db_user     = jsondecode(local.mysql.secret_string)["username"]
#       db_password = jsondecode(local.mysql.secret_string)["password"]
#     }
#   )
#   tags = {
#     Name = local.Name[count.index]
#   }
#   lifecycle {
#     ignore_changes = [
#     ]
#   }
# }*/

# resource "aws_key_pair" "bastion_instance" {
#   key_name   = "jenkins_ssh_file"
#   public_key = file("${path.module}/template/jenkins_ssh_file.pub")
# }

# resource "aws_ssm_parameter" "ssm_kp" {
#   name  = format("%s-%s", var.component_name, "ssm-kp")
#   type  = "SecureString"
#   value = " "
#   lifecycle {
#     ignore_changes = [
#       value,
#     ]
#   }
# }
