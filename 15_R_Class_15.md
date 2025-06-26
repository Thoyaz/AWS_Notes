* Application Load Balencer (ALB)
    * HTTP to HTTPS redirection
    * path/url based routing
    * Blue/Green or Canary Based Deployments
* Web Application Firewall (WAF)

## Lab for Application Load Balencer (ALB)

* Create VPC 
* Create 4 servers
    * Home-Page-1
    * Home-Page-2
    * Songs-Page
    * Movies-Page

## Gole

![alt text](./Images/aws_alb_07.png)

### Path Based Routing
* Now our gole is, If we hit https://public-ip/movies/, It should route to movies OR If we hit https://public-ip/songs/, It should route to songs, This is called as path based routing

![alt text](./Images/aws_alb_01.png)
![alt text](./Images/aws_alb_02.png)

* Now if you try to access

![alt text](./Images/aws_alb_03.png)
![alt text](./Images/aws_alb_04.png)
![alt text](./Images/aws_alb_05.png)
![alt text](./Images/aws_alb_06.png)

* Now Create Target Groups
    * Create Home page TG
        * Choose Target Type : Instences
        * Target Group Name : HomePage-TG
        * Protocol AND Port: HTTP/80
        * IP address type : HTTP
        * Select VPC
        * Health Check : HTTP
        * next
        * Available Instances, Select Only HomePage Instances
        * Create TG
    * Create Movies TG
        * Choose Target Type : Instences
        * Target Group Name : Movies-TG
        * Protocol AND Port: HTTP/80
        * IP address type : HTTP
        * Select VPC
        * Health Check : HTTP
        * next
        * Available Instances, Select Only Movies Instances
        * Create TG
    * Create Songs TG
        * Choose Target Type : Instences
        * Target Group Name : Songs-TG
        * Protocol AND Port: HTTP/80
        * IP address type : HTTP
        * Select VPC
        * Health Check : HTTP
        * next
        * Available Instances, Select Only Songs Instances
        * Create TG

* Create ALB
    * LB Name : AWS-ALB
    * Scheme : Internet-facing
    * Select VPC
    * Select Mappings ( Select Public Subnets only )
    * Select SG
    * Listeners and Routing
        * HTTPS/443, Select TG (HomePage-TG)
    * Default SSL/TLS server certificate
        * Certificate Source
            * From ACM (Select AWS provided certificate)
    * Create LB
    * IT WILL TAKE TIME, TO CREATE

* Adding Listeners To ALB
    * Click on Add Listener
    * Listener configuration
        * HTTP/80
    * Default Action : Redirect to URL
        * Full URL : 
        * Click ADD

* Enable Monitoring
    * Create S3 bucket
    * Goto LB and on Attributes enable Monitoring

* Add Routes in Route53
    * create wild card record
        * Record Name : www.tzpcsystems.xyz
        * Record Type : A
        * Turn ON Alias
        * Route Traffic To : Alias to ALB
        * Choose Region : us-east-1
        * Select ALB
        * Save
    * Create naked record
        * Record Name : KEEP BLANK
        * Record Type : A
        * Route Traffic To : Alias to ALB
        * Choose Region : us-east-1
        * Select ALB
        * Save

### Now Test our Lab
* Try to access http://tzpcsystems.xyz, It should redirect to https://tzpcsystems.xyz
* Try to access http://www.tzpcsystems.xyz, It should redirect to https://www.tzpcsystems.xyz

* But if you try to access tzpcsystems.xyz/movies/ or tzpcsystems.xyz/songs/ you will get below error

![alt text](./Images/aws_alb_08.png)

* To do path based routing, We need to add Listeners and rules for ALB
* Add Path based routing for Movies

![alt text](./Images/aws_alb_09.png)
![alt text](./Images/aws_alb_10.png)
![alt text](./Images/aws_alb_11.png)
![alt text](./Images/aws_alb_12.png)
![alt text](./Images/aws_alb_13.png)
![alt text](./Images/aws_alb_14.png)
![alt text](./Images/aws_alb_15.png)
![alt text](./Images/aws_alb_16.png)

* Add Path based routing for Movies

![alt text](./Images/aws_alb_17.png)
![alt text](./Images/aws_alb_18.png)
![alt text](./Images/aws_alb_19.png)
![alt text](./Images/aws_alb_20.png)
![alt text](./Images/aws_alb_21.png)
![alt text](./Images/aws_alb_22.png)
![alt text](./Images/aws_alb_23.png)

* Add Path based routing for Songs 

![alt text](./Images/aws_alb_24.png)
![alt text](./Images/aws_alb_25.png)
![alt text](./Images/aws_alb_26.png)
![alt text](./Images/aws_alb_27.png)
![alt text](./Images/aws_alb_28.png)
![alt text](./Images/aws_alb_29.png)


* If you try to access tzpcsystems.xyz/movies/ or tzpcsystems.xyz/songs/ It will work

### Blue/Green

![alt text](./Images/blue_gree_deployment.png)

* Create New Server which is HomePage-NewVersion
* Create New TG, To test this
    * Choose Target Type : Instences
    * Target Group Name : NewVersion-TG
    * Protocol AND Port: HTTP/80
    * IP address type : HTTP
    * Select VPC
    * Health Check : HTTP
    * next
    * Available Instances, Select Only NewVersio Instances
    * Create TG

* Now add that to ALB

![alt text](./Images/aws_alb_30.png)
![alt text](./Images/aws_alb_31.png)
![alt text](./Images/aws_alb_32.png)
![alt text](./Images/aws_alb_33.png)
![alt text](./Images/aws_alb_34.png)

### Canary Based Deployments

![alt text](./Images/Canary_Deployment.png)
![alt text](./Images/aws_alb_30.png)
![alt text](./Images/aws_alb_31.png)
![alt text](./Images/aws_alb_32.png)
![alt text](./Images/aws_alb_35.png)
![alt text](./Images/aws_alb_34.png)


## Web Application Firewall (WAF)
* WAF will provide additional layer of protection for the applications
### If you want to block IP's
* First create __IP set__

![alt text](./Images/aws_waf_01.png)
* Under IP Addresses, Prove IP's which you want to block \
__EX : 123.12.12.1/32__
* Now create __Web ACL(Access Control List)__

![alt text](./Images/aws_waf_02.png)
![alt text](./Images/aws_waf_03.png)
![alt text](./Images/aws_waf_04.png)
![alt text](./Images/aws_waf_05.png)
![alt text](./Images/aws_waf_06.png)
![alt text](./Images/aws_waf_07.png)
![alt text](./Images/aws_waf_08.png)
![alt text](./Images/aws_waf_09.png)
![alt text](./Images/aws_waf_10.png)
![alt text](./Images/aws_waf_11.png)
![alt text](./Images/aws_waf_12.png)

### If you want to block Browser's Like Microsoft Edge

![alt text](./Images/aws_waf_12.png)
![alt text](./Images/aws_waf_13.png)
![alt text](./Images/aws_waf_14.png)
![alt text](./Images/aws_waf_15.png)
![alt text](./Images/aws_waf_16.png)
![alt text](./Images/aws_waf_17.png)
![alt text](./Images/aws_waf_18.png)
![alt text](./Images/aws_waf_19.png)


### What if Blocked IP people will use VPN to access our website

![alt text](./Images/aws_waf_20.png)
![alt text](./Images/aws_waf_21.png)
![alt text](./Images/aws_waf_22.png)
![alt text](./Images/aws_waf_23.png)
![alt text](./Images/aws_waf_24.png)

* Remove Block IP List, To test more

### What if people hitting your website frequently, Or They are running scripts to down our application

![alt text](./Images/aws_waf_25.png)
![alt text](./Images/aws_waf_26.png)
![alt text](./Images/aws_waf_27.png)
![alt text](./Images/aws_waf_28.png)
![alt text](./Images/aws_waf_29.png)
![alt text](./Images/aws_waf_30.png)
![alt text](./Images/aws_waf_31.png)

## AWS Shield
* To Stop DSoS Attacks aws will provide a service called AWS Shield