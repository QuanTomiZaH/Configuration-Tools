# aws_route
# aws_route_table
# aws_route_table_association
# # Route table
#
# resource "aws_route_table" "default" {
#   vpc_id = "${aws_vpc.main.vpc_id}"
#   route {
#     cidr_block  = "0.0.0.0/0"
#     gateway_id  = "${aws_internet_gateway.main.id}"
#   }
# }
# # Route table association
# resource "aws_route_table_association" "main" {
#   subnet_id       = "${aws_subnet.main.id}"
#   route_table_id  = "${aws_route_table.default.id}"
# }


