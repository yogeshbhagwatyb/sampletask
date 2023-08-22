
resource "aws_subnet" "private_subnets" {
#  count = 4
# cidr_block = "10.0.${count.index - 1}.0/24"
 cidr_block = "10.0.240.0/24"


 vpc_id     = data.aws_vpc.vpc.id
}

#resource "aws_subnet" "private_subnets" {
#  vpc_id     = data.aws_vpc.vpc.id
#  cidr_block = "10.0.245.0/24"

#  tags = {
#    Name = "Main"
#  }
#}



resource "aws_route_table" "private" {
  vpc_id = data.aws_vpc.vpc.id
}

resource "aws_route_table_association" "private" {
  count          = 4
  subnet_id      = aws_subnet.private_subnets.id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "lambda_sg" {
  vpc_id = data.aws_vpc.vpc.id
}

#resource "aws_lambda_function" "example" {
#   function_name    = "example-lambda"
#   role             = data.aws_iam_role.lambda.arn
#   handler          = "index.handler"
#   runtime          = "nodejs14.x"
#   filename         = "path/to/lambda.zip"
#   source_code_hash = filebase64sha256("path/to/lambda.zip")

#   vpc_config {
#     subnet_ids         = aws_subnet.private_subnets[*].id
#     security_group_ids = [aws_security_group.lambda_sg.id]
#   }
# }




#resource "aws_security_group_rule" "lambda_ingress" {
#  type        = "ingress"
#  from_port   = 0
#  to_port     = 65535
#  protocol    = "tcp"
#  cidr_blocks = ["0.0.0.0/0"]
#  security_group_id = aws_security_group.lambda_sg.id
#}
