Agenda:
1. AWS Network Firewall
2. Buy a Domain and Configure it to Route53

## AWS Network Firewall
__Usecase :__ If we want to block WebPages like YouTube, FaceBook, SBI Bank..etc, Usign AWS Network Firewall we can achive this.

## Lab : Blocking Youtube 

![alt text](./Images/AWS_NetworkFirewall.png)

* VPC with CIDR Range 10.1.0.0/16

* Create two subnets
   * ProtectedSubnet - 10.1.10.0/24(PrivateSubnet Towards Firewall)
   * FirewallSubnet - 10.1.1.0/24(PublicSubnet)

* Deploy a Windows Server in the Protected/Private Subnet.
    * While creating instance enable auto-assign public IP
    * Allow all traffic from Securitygroup
    * Launch instance

* Create __Network Firewall: Rule Group__, Click on create network firewall rule group, Follow below images

![alt text](./Images/AWS_NetworkFirewall_Step_1.png)

![alt text](./Images/AWS_NetworkFirewall_Step_2.png)

* Initially we will __allow only Google__

![alt text](./Images/AWS_NetworkFirewall_Step_3.png)

![alt text](./Images/AWS_NetworkFirewall_Step_4.png)

![alt text](./Images/AWS_NetworkFirewall_Step_5.png)

* Allow RDP for instance, To do that follow below images

* Create __Network Firewall: Rule Group__, Click on create network firewall rule group

![alt text](./Images/AWS_NetworkFirewall_Step_6.png)

![alt text](./Images/AWS_NetworkFirewall_Step_7.png)

![alt text](./Images/AWS_NetworkFirewall_Step_8.png)

![alt text](./Images/AWS_NetworkFirewall_Step_9.png)

* Overall we need to create below roules

![alt text](./Images/AWS_NetworkFirewall_Step_10.png)

* Now Create a Firewall Policy
    * Goto __VPC -> Network Firewall: Firewall Policies -> Create Firewall Policy__

![alt text](./Images/AWS_NetworkFirewall_Step_11.png)

![alt text](./Images/AWS_NetworkFirewall_Step_12.png)

![alt text](./Images/AWS_NetworkFirewall_Step_13.png)

![alt text](./Images/AWS_NetworkFirewall_Step_14.png)

![alt text](./Images/AWS_NetworkFirewall_Step_15.png)

* Click on __Create Firewall Policy__

* Now we need to deploy __Firewall__ __( IT WILL TAKE TIME TO CREATE - 15 MIN )__
```
VPC -> Network Firewall -> Firewalls
```

![alt text](./Images/AWS_NetworkFirewall_Step_16.png)

![alt text](./Images/AWS_NetworkFirewall_Step_17.png)

![alt text](./Images/AWS_NetworkFirewall_Step_18.png)

![alt text](./Images/AWS_NetworkFirewall_Step_19.png)

* Next, Click on __Create Firewall__

* Firewall Deployed Successfully

![alt text](./Images/AWS_NetworkFirewall_Step_20.png)

* If you check in __Endpoints__, We can see one firewall endpoint which was created

![alt text](./Images/AWS_NetworkFirewall_Step_24.png)

* Now edit Route Tables
    * Create one New Route Table, We are creating this for traffic which we are getting from internet to server

![alt text](./Images/AWS_NetworkFirewall_Step_21.png)

![alt text](./Images/AWS_NetworkFirewall_Step_22.png)

![alt text](./Images/AWS_NetworkFirewall_Step_23.png)

* Now add routes as instructed in below
* For Protected Subnet add 0.0.0.0/0 to Firewall vpce eni interface like eni-07327ef76d9a5401d.

![alt text](./Images/AWS_NetworkFirewall_Step_27.png)

![alt text](./Images/AWS_NetworkFirewall_Step_28.png)

* For Firewall Subnet add 0.0.0.0/0 to IGW which is a public subnet.
* For IGWIngressSubnetRT, select EdgeAssosiattions and select IGW, In the same routing table, select routes, in the destination provide CIDR range of ProtectedSubnet and give target as Firewall vpce eni eni-07327ef76d9a5401d.

![alt text](./Images/AWS_NetworkFirewall_Step_25.png)

![alt text](./Images/AWS_NetworkFirewall_Step_26.png)

* Now Login to Instance
    * After login to instance, If you try to access Youtube, FB..etc, You cannot access these website except GOOGLE

![alt text](./Images/AWS_NetworkFirewall_Step_29.png)

* Now to allow websites like YouTube
    * Goto 
```
VPC -> Network Firewall: Rule Groups -> AWS_Domain_Rule_Group
```
* Click on edit

![alt text](./Images/AWS_NetworkFirewall_Step_30.png)

![alt text](./Images/AWS_NetworkFirewall_Step_31.png)

* Now able to access YouTube

![alt text](./Images/AWS_NetworkFirewall_Step_32.png)

* Now if you try to ping google.com it won't work as we need to allow ICMP protocl

![alt text](./Images/AWS_NetworkFirewall_Step_33.png)

![alt text](./Images/AWS_NetworkFirewall_Step_34.png)

![alt text](./Images/AWS_NetworkFirewall_Step_35.png)

![alt text](./Images/AWS_NetworkFirewall_Step_36.png)

![alt text](./Images/AWS_NetworkFirewall_Step_37.png)

![alt text](./Images/AWS_NetworkFirewall_Step_38.png)

## To Store the firewall traffic logs

![alt text](./Images/AWS_NetworkFirewall_Step_39.png)

![alt text](./Images/AWS_NetworkFirewall_Step_40.png)

![alt text](./Images/AWS_NetworkFirewall_Step_41.png)

## Delete Lab
* First Delete Routes in __Route Table__
* Delete Firewall
* Delete Server/Instance
