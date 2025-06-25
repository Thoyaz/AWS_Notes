0. OSI Layers
1. Types of Load Balancers
    - VPC Based or Region based Load Balancer
        1. Network Load Balancer - TCP/UDP - Layer 4 LB.
        2. Application Load Balaner - Later 7 LB
        3. Classic Load Balancer
        4. Gatway Load Balancer

    - Global Load Balancer
        1. Route53 Routing Policies
        2. Global Accelerator
2. Deploying Network Load Balancer(NLB)
3. Configuring http & https.

## OSI Layers
![alt text](./Images/osi_layers.png)

## Network Load Balancer
* Create VPC, with 3 public subnet's
* Create three EC2 Servers on Public Subnet (Just for learning NLB)
* First, Now create Target Group

![alt text](./Images/aws_nlb_01.png)
![alt text](./Images/aws_nlb_02.png)
![alt text](./Images/aws_nlb_03.png)
![alt text](./Images/aws_nlb_04.png)
![alt text](./Images/aws_nlb_05.png)
![alt text](./Images/aws_nlb_06.png)

* Now create Load Balencer

![alt text](./Images/aws_nlb_07.png)
![alt text](./Images/aws_nlb_08.png)
![alt text](./Images/aws_nlb_09.png)
![alt text](./Images/aws_nlb_10.png)
![alt text](./Images/aws_nlb_11.png)
![alt text](./Images/aws_nlb_12.png)
![alt text](./Images/aws_nlb_13.png)
![alt text](./Images/aws_nlb_14.png)
![alt text](./Images/aws_nlb_15.png)
![alt text](./Images/aws_nlb_16.png)

__NOTE :__ It will take time to create LB

* Now add Routes in ROute 53
    * Go to your domain
    * Routing Policy : simple routing
    * Click on Define a simple ROuting
    * Record Name : www.tzpc.xyz
    * Record Type : A
    * Value/Route Traffic to : Alias to Network Load Balencer
    * Region : us-east-1
    * Select Our LB
    * Create Record

* For LB, We can attach More than 1 Target Groups, Below is the Example
    * Create one TG

![alt text](./Images/aws_nlb_17.png)
![alt text](./Images/aws_nlb_18.png)
![alt text](./Images/aws_nlb_19.png)
![alt text](./Images/aws_nlb_20.png)
![alt text](./Images/aws_nlb_21.png)
![alt text](./Images/aws_nlb_22.png)
![alt text](./Images/aws_nlb_23.png)
![alt text](./Images/aws_nlb_24.png)

* Now attach TG to LB

![alt text](./Images/aws_nlb_25.png)
![alt text](./Images/aws_nlb_26.png)
![alt text](./Images/aws_nlb_27.png)

* Enable Logging on LB, As shown in below
* Create S3 Bucket
    * While creating uncheck __Block All Public Access__
* Go to Bucket Permitions
    * Click on Edit Bucket Policy, Past the json which i provided in __Scripts__

![alt text](./Images/aws_nlb_29.png) 
![alt text](./Images/aws_nlb_30.png) 

### Things not possible in NLB:
1. HTTP to HTTPS Redirection.
2. URL/Path Based Routing
3. Blue/Green or Canary Based Deployment.
4. Integration with Web Application Firewall(WAF)

### Delete Lab
* Delete NLB
* Delete EC2 Servers
* Delete Target Groups
* Delete S3
* Delete VPC

### Interview Question
__Differnece between NLB and ALB__ \
NLB, Which supports both TCP and UDP, But NLB has more strength for UDP protocols
NLB Does not Support HTTPS redirection

__TDP VS UDP__
![alt text](./Images/aws_nlb_28.png) 