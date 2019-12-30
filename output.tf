output "instance-ip" {
  value       = aws_instance.rails-app-server.public_ip
  description = "The public IP of the main server instance."
}