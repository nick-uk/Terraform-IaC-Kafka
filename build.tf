provider "aws" {
  region = "eu-west-2"
}

####################################
variable subnet_eu-west-2a-public_id {}
variable subnet_eu-west-2b-public_id {}
variable subnet_eu-west-2c-public_id {}
variable security_group_id {}

####################################

resource "aws_key_pair" "kafka-key" {
  key_name   = "kafka-key"
  public_key = "${file("${path.module}/../../../.ssh/aws-key.pub")}"
}

resource "aws_launch_configuration" "kafka-dev-1" {
  name_prefix                 = "DEV-KAFKA-"
  image_id                    = "ami-5daa463a"
  instance_type               = "t3.small"
  spot_price                  = "0.0071"
  key_name                    = "${aws_key_pair.kafka-key.id}"
  security_groups             = ["${var.security_group_id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/bootstrapit.sh")}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 10
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_autoscaling_group" "kafka-dev" {
  name                 = "kafka-dev"
  launch_configuration = "${aws_launch_configuration.kafka-dev-1.id}"
  max_size             = 1
  min_size             = 1
  health_check_grace_period = 60
  vpc_zone_identifier  = [ "${var.subnet_eu-west-2a-public_id}" , "${var.subnet_eu-west-2b-public_id}" , "${var.subnet_eu-west-2c-public_id}" ]


  tag {
    key                 = "Name"
    value               = "Kafka"
    propagate_at_launch = true
  }
}