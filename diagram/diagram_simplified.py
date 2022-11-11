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
    with Cluster("TFE"):   
        tfe_server_group = [EC2("TFE Server"),
                            EC2("TFE Server"),
                            EC2("TFE Server"),]
    with Cluster("Agents"):
        tfe_agent_group = [EC2("TFE agent"),
                             EC2("TFE agent"),
                             EC2("TFE agent"),
                             EC2("TFE agent"),
                             EC2("TFE agent")]
        
    # Diagram
    user >>  loadbalancer1 >> tfe_server_group
    tfe_server_group >> bucket_tfe         
    tfe_server_group >> postgresql  
    tfe_server_group >> redis                                    
                               
    loadbalancer1  << tfe_agent_group 

    
diag
