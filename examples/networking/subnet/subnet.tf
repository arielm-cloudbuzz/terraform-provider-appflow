# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "aws_subnet" "main" {
  cidr_block        = cidrsubnet(data.aws_vpc.target.cidr_block, 2, var.az_numbers[data.aws_availability_zone.target.name_suffix])
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
}

resource "aws_route_table" "main" {
  vpc_id = var.vpc_id
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}
