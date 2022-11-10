from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import EC2, EC2AutoScaling
from diagrams.aws.network import Route53,VPC, PrivateSubnet, PublicSubnet, InternetGateway, NATGateway, ElbApplicationLoadBalancer
from diagrams.onprem.compute import Server
from diagrams.aws.storage import SimpleStorageServiceS3Bucket
from diagrams.aws.database import RDSPostgresqlInstance, ElasticacheForRedis
from diagrams.aws.compute import EC2

# Variables
title = "5 TFE instances with 10 TFE agents"
outformat = "png"
filename = "diagram_simplified"
direction = "TB"


with Diagram(
    name=title,
    direction=direction,
    filename=filename,
    outformat=outformat,
) as diag:
    # Non Clustered
    user = Server("user")
    loadbalancer1 = ElbApplicationLoadBalancer("Application \n Load Balancer")
    bucket_tfe = SimpleStorageServiceS3Bucket("TFE bucket")
    postgresql = RDSPostgresqlInstance("RDS Instance")
    redis = ElasticacheForRedis("Redis Instance")        
    tfe_server1 = EC2("TFE Server")
    tfe_server2 = EC2("TFE Server")
    tfe_server3 = EC2("TFE Server")
    tfe_server4 = EC2("TFE Server")
    tfe_server5 = EC2("TFE Server")
    tfe_agent1 = EC2("TFE agent")
    tfe_agent2 = EC2("TFE agent")
    tfe_agent3 = EC2("TFE agent")
    tfe_agent4 = EC2("TFE agent")
    tfe_agent5 = EC2("TFE agent")
    tfe_agent6 = EC2("TFE agent")
    tfe_agent7 = EC2("TFE agent")
    tfe_agent8 = EC2("TFE agent")
    tfe_agent9 = EC2("TFE agent")
    tfe_agent10 = EC2("TFE agent")
 
    # Diagram
    user >>  loadbalancer1 >> [tfe_server1, 
                               tfe_server2,
                               tfe_server3,
                               tfe_server4,
                               tfe_server5] >> [tfe_agent1,
                                                tfe_agent2,
                                                tfe_agent3,
                                                tfe_agent4,
                                                tfe_agent5,
                                                tfe_agent6,
                                                tfe_agent7,
                                                tfe_agent8,
                                                tfe_agent9,
                                                tfe_agent10]

    
diag
