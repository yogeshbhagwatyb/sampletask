resource "aws_subnet" "private_subnets" {
 cidr_block = "10.0.240.0/24"
 vpc_id     = data.aws_vpc.vpc.id
}


resource "aws_subnet" "private_subnets1" {
 cidr_block = "10.0.241.0/24"
 vpc_id     = data.aws_vpc.vpc.id
}

resource "aws_subnet" "private_subnets2" {
 cidr_block = "10.0.242.0/24"
 vpc_id     = data.aws_vpc.vpc.id
}

resource "aws_subnet" "private_subnets3" {
 cidr_block = "10.0.243.0/24"
 vpc_id     = data.aws_vpc.vpc.id
}


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

resource "aws_lambda_function" "example" {
   function_name    = "lambda_function.py"
   role             = data.aws_iam_role.lambda.arn
   handler          = "lambda_function.py"
   #runtime          = "python 3.10"
   filename         = "path/to/lambda.zip"
  source_code_hash = filebase64sha256("path/to/lambda.zip")

  vpc_config {
     subnet_ids         = aws_subnet.private_subnets[*].id
     security_group_ids = [aws_security_group.lambda_sg.id]
   }
 }

