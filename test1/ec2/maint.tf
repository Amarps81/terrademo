provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
    ami = "ami-00f251754ac5da7f0"
    instance_type = "t2.micro"
    provisioner "remote-exec" {
        inline = [ 
            "sudo yum -y install httpd && sudi systemctl start httpd",
            "echo '<h1><center>My Test Website With Help From Terraform Provisioner</center></h1>' > index.html",
            "sudo mv index.html /var/www/html/"  
        ]
            
    }
    tags = {
      Name = "webserver"
    }
  
}
