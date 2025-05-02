Agenda:
1. Virtual Private Network (VPN) from AWS to Azure

## Setup in Azure
* Login to Azure, And create Virtual Network ( VN ), Below are the steps to create Virtual Network

![alt text](./Images/Creating_Virtual_Network_in_Azure_Step_1.png)

![alt text](./Images/Creating_Virtual_Network_in_Azure_Step_2.png)

![alt text](./Images/Creating_Virtual_Network_in_Azure_Step_3.png)

![alt text](./Images/Creating_Virtual_Network_in_Azure_Step_4.png)

* Now open the Virtual Network and Goto Subnets onit, Click on Gateway Subnet to create Virtual Network Gateway ( VNG )

![alt text](./Images/Creating_Virtual_Network_in_Azure_Step_5.png)

* Now Goto Virtual Network Gateway ( VNG ) Service

![alt text](./Images/Creating_Virtual_Network_in_Azure_Step_6.png)

![alt text](./Images/Creating_Virtual_Network_in_Azure_Step_7.png)

![alt text](./Images/Creating_Virtual_Network_in_Azure_Step_8.png)

![alt text](./Images/Creating_Virtual_Network_in_Azure_Step_9.png)

```
NOTE : It will take 18 to 30 Min to create VNG
```

## Lab to establish connection from AWS to Azure

![alt text](./Images/Creating_Virtual_Network_in_Azure_Step_10.png)

* Now here, we need to add Azure server to AWS AD Server Private table, And If we create some users in AWS AD Server, And using that users if we login to Azure AD Server Authentication should be done in AWS AD Server, End off the day we need to connect privately.

### Create Azure AD Server
* Follow below images to create Win VM.

![alt text](./Images/Azure_AD_VM_Creation_Step_1.png)

![alt text](./Images/Azure_AD_VM_Creation_Step_2.png)

![alt text](./Images/Azure_AD_VM_Creation_Step_3.png)

![alt text](./Images/Azure_AD_VM_Creation_Step_4.png)

![alt text](./Images/Azure_AD_VM_Creation_Step_5.png)

![alt text](./Images/Azure_AD_VM_Creation_Step_6.png)

![alt text](./Images/Azure_AD_VM_Creation_Step_7.png)

### Install Azure AD in the Server

* Login to VM
* Disable Firewall using ``firewall.cpl``
* Try to ping AWS AD Server using private IP of it, from Azure Server, It wont work.
* Try to ping Azure AD Server using Private IP of it, from AWS Server, It wont work.
* Change ```DNS Server```, It should be ```IPv4 Address```, Follow below images to do it in Azure

![alt text](./Images/Azure_DNS_Server_Change_Step_1.png)

![alt text](./Images/Azure_DNS_Server_Change_Step_2.png)

![alt text](./Images/Azure_DNS_Server_Change_Step_3.png)

* Allow All Traffic

![alt text](./Images/Azure_DNS_Server_Change_Step_4.png)

![alt text](./Images/Azure_DNS_Server_Change_Step_5.png)

* Reboot the Azure AD Server

![alt text](./Images/Azure_DNS_Server_Change_Step_6.png)


### To know about AWS to Azure

* Follow below images to tell about AWS Site-to-site VPN to Azure

![alt text](./Images/To_know_about_AWS_Site_to_Site_VPN_to_Azure.png)

![alt text](./Images/To_know_about_AWS_Site_to_Site_VPN_to_Azure_Step_2.png)

![alt text](./Images/To_know_about_AWS_Site_to_Site_VPN_to_Azure_Step_4.png)

![alt text](./Images/To_know_about_AWS_Site_to_Site_VPN_to_Azure_Step_5.png)

To get IP Address for About images, You can get it from AWS, As shown in below

![alt text](./Images/To_know_about_AWS_Site_to_Site_VPN_to_Azure_Step_3.png)


--------------
CONTINUE
--------------

## Install Active Directory in AWS Servers
* Login to the Win Server ( Connect using RDP )
* Open PowerShell using Administrator access
    * give ``ipconfig /all``

![alt text](./Images/AD_Installation_step_1.png)

* TO install Active Directory ( AD ), We need to keep __DNS Server__ as same as __IPv4 Address__

* Enter ``ncpa.cpl``

![alt text](./Images/AD_Installation_step_2.png)

* Right click on ``Eathernet 2``, Click on ``Properties``

![alt text](./Images/AD_Installation_step_3.png)

* Select ``Internet Protocol Version 4(TCP/IPv4)`` and click on ``Properties``

![alt text](./Images/AD_Installation_step_4.png)


* __NOTE :__ Disable Firewall, Use below CMD ``firewall.cpl``, If we enable firewall by default pind wont work, Firewall dont allow ping, So disable firewall for testing.

![alt text](./Images/AD_Installation_step_5.png)

![alt text](./Images/AD_Installation_step_6.png)

* Open Server Manager, To install AD

![alt text](./Images/AD_Installation_step_7.png)

![alt text](./Images/AD_Installation_step_8.png)

![alt text](./Images/AD_Installation_step_9.png)

![alt text](./Images/AD_Installation_step_10.png)

![alt text](./Images/AD_Installation_step_11.png)

![alt text](./Images/AD_Installation_step_12.png)

![alt text](./Images/AD_Installation_step_13.png)

![alt text](./Images/AD_Installation_step_14.png)

![alt text](./Images/AD_Installation_step_15.png)

![alt text](./Images/AD_Installation_step_16.png)

![alt text](./Images/AD_Installation_step_17.png)

![alt text](./Images/AD_Installation_step_18.png)

![alt text](./Images/AD_Installation_step_19.png)

![alt text](./Images/AD_Installation_step_20.png)

![alt text](./Images/AD_Installation_step_21.png)

![alt text](./Images/AD_Installation_step_22.png)

> __NOTE :__ It will install and Server will be automatically reboot

* After Reboot, Try to login as shown in below
* After Reboot, Try to Disable Firewall again because we had assigned server to domain.

![alt text](./Images/AD_Installation_step_23.png)

![alt text](./Images/AD_Installation_step_24.png)

* TO Verify, AD is installed or not
    * Open CMD with Admin access and enter ``dsa.msc``, You will see the AD with users as shown in below

![alt text](./Images/AD_Installation_step_25.png)

### Create Users in AWS AD Server

![alt text](./Images/Creating_User_in_AD_step_1.png)

![alt text](./Images/Creating_User_in_AD_step_2.png)

![alt text](./Images/Creating_User_in_AD_step_3.png)

![alt text](./Images/Creating_User_in_AD_step_4.png)

![alt text](./Images/Creating_User_in_AD_step_5.png)

![alt text](./Images/Creating_User_in_AD_step_6.png)

![alt text](./Images/Creating_User_in_AD_step_7.png)

* Now Copy the Anand user and create another user

![alt text](./Images/Creating_User_in_AD_step_8.png)



### Create VPG in AWS
* Goto __VPC__, Select __Virtual Private Gateway__ under __Virtual Private Network (VPN)__
* Follow Below Steps

![alt text](./Images/VPG_Creation_Step_1.png)

* Attach VPG to VPC ( VPC which AWS AD Server was created )

![alt text](./Images/VPG_Creation_Step_2.png)

![alt text](./Images/VPG_Creation_Step_3.png)

* Edit the Route Table, Which is associated with our AWS AD Server

![alt text](./Images/VPG_Creation_Step_4.png)

* Now to know AWS VPG and Azure VNG each other we need the public IP's which was associated with each other

* To Know AWS VPG about Azure VNG, Take public IP of Azure VNG and Goto AWS VPC
    * Goto __Customer Gateway__ on __Virtual Private Network__
    * Click on __Create Customer Gateway__

![alt text](./Images/VPG_Creation_Step_5.png)

### Configure VPN in AWS
* Goto VPC, Under __Virtual Private Network__, Select __Site-to-Site-VPN Connections__ 

![alt text](./Images/Site_to_Site_VPN_Connections_Step_1.png)

![alt text](./Images/Site_to_Site_VPN_Connections_Step_2.png)

* Click on __Create VPN Connection__



## Our Gole

![alt text](./Images/OurGole_in_VPG_CREATION.png)

When we try to RDP to Azure AD Server, using Anand user creds, Authentication needs to be done by AWS AD Server, Privately using VPN.

## What If we have More than one VPC's in AWS 
* Then we need to make conection as shown in the image

![alt text](./Images/What_If_we_have_more_vpc_in_aws.png)

```
BUT THIS IS NOT RECOMENDED WAY, TO SOLVE ABOVE PROBLEM WE CAN USE TRANSIT GATEWAY
```