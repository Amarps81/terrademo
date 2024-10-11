output "public-ip-address" {
  value = aws_instance.appserver.public_ip
}