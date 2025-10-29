provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

# Fetch all available Availability Zones
data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0"  # Specify an appropriate AMI ID
    instance_type = "t3.micro"
    subnet_id     = "subnet-00d448c4c9d49cc94" # Specify an appropriate SUBENT ID
    key_name      = "My_Key" # Specify an appropriate KEY Name
    availability_zone = data.aws_availability_zones.available.names[0]
}
