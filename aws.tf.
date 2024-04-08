# main.tf

provider "aws" {
  region = "us-east" 
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # AMI ID, 
  instance_type = "t2.micro" # גודל המכונה
  key_name      = "yotam" 

  tags = {
    Name = "My EC2 Instance"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/home/yotam/Desktop/yotam.pem") 
    host        = self.public_ip
  }
}

# provision.tf

resource "aws_instance" "example" {
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y git",
      "sudo yum install -y python3 python3-pip",
      "sudo pip3 install flask",
      "sudo yum install docker -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "git clone https://github.com/yotamdavid/ferari_docker2.git",
      "cd ferari_docker2/ferari_docker/web_project",
      "docker-compose run -d",
      "sudo yum update -y",

    ]
  }
}
