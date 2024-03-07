#Aula-09
resource "aws_route_table" "rt_desafio_devops" {
    vpc_id = aws_vpc.vpc_desafio_devops.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    
  tags = {
    Name = "rt_desafio_devops"
  }
}

# jeito antigo de declarar com array
#route = [ 
#     {
#         carrier_gateway_id = ""
#         cidr_block = "0.0.0.0/0"
#         destination_prefix_list_id = ""
#         egress_only_gateway_id = ""
#         gateway_id = aws_internet_gateway.gw.id
#         instance_id = ""
#         ipv6_cidr_block = ""
#         local_gateway_id = ""
#         nat_gateway_id = ""
#         network_interface_id = ""
#         transit_gateway_id = ""
#         vpc_endpoint_id = ""
#         vpc_peering_connection_id = ""
#         core_network_arn = ""
#     }
#     ]