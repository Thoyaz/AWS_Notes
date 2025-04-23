# 🌐 Understanding Subnetting in AWS VPC

## 🔍 What is Subnetting?

**Subnetting** is the process of dividing a large IP address block into smaller, more manageable ranges called **subnets**. It is especially important in AWS VPC design to:

- Organize workloads  
- Control traffic flow via routing  
- Isolate resources (security and compliance)  
- Optimize IP address usage  

> 🎯 Subnetting enables scalability, security, and clarity in your cloud architecture.

---

## 🛠 Helpful Tools for Subnetting

Use these tools to make subnet planning quick and accurate:

- 🔗 [**Subnet Calculator**](https://www.subnet-calculator.com/) – Quickly calculate IP ranges.  
- 🔗 [**CIDR Subnet Designer**](https://www.davidc.net/sites/default/subnets/subnets.html) – Visually plan subnet breakdowns.  

> 🧠 These tools reduce manual errors and save time during VPC design.

---

## 📘 Real-World Scenario

### 🎯 Starting Block:
You have a primary CIDR block:

```bash
CIDR: 172.16.0.0/16
```

### 📌 Subnetting Requirements:

| Purpose         | Subnet Size | Quantity | Description             |
|-----------------|-------------|----------|--------------------------|
| Private Subnets | `/22`       | 3        | App, database, backend   |
| Public Subnets  | `/24`       | 3        | Web, load balancers      |
| TGW Subnets     | `/26`       | 3        | Transit Gateway access   |
| VPN Subnets     | `/28`       | 3        | Site-to-site VPN tunnels |

---

## 🧭 Subnetting Strategy

> ✅ **Start allocating from larger subnets to smaller ones** to avoid overlaps and fragmentation.

### 📐 Strategy in Steps:
1. Break `/16` into `/20` or `/22` chunks.  
2. Allocate `/22` blocks first (Private).  
3. Then assign `/24` (Public), `/26` (TGW), and `/28` (VPN) subnets.  
4. Keep clean boundaries (e.g., `172.16.0.0`, `172.16.4.0`) for clarity.  

---

## 📊 Sample Subnet Allocation

| Subnet Type     | CIDR Block           | # IPs | Use Case         | AZ     |
|-----------------|----------------------|-------|------------------|--------|
| Private Subnet 1 | `172.16.0.0/22`     | 1024  | App Tier         | us-east-1a |
| Private Subnet 2 | `172.16.4.0/22`     | 1024  | DB Tier          | us-east-1b |
| Private Subnet 3 | `172.16.8.0/22`     | 1024  | Internal Services| us-east-1c |
| Public Subnet 1  | `172.16.12.0/24`    | 256   | Web Servers      | us-east-1a |
| Public Subnet 2  | `172.16.13.0/24`    | 256   | Load Balancers   | us-east-1b |
| Public Subnet 3  | `172.16.14.0/24`    | 256   | Monitoring       | us-east-1c |
| TGW Subnet 1     | `172.16.15.0/26`    | 64    | TGW Attachment   | -      |
| TGW Subnet 2     | `172.16.15.64/26`   | 64    | TGW Attachment   | -      |
| TGW Subnet 3     | `172.16.15.128/26`  | 64    | TGW Attachment   | -      |
| VPN Subnet 1     | `172.16.15.192/28`  | 16    | VPN Gateway 1    | -      |
| VPN Subnet 2     | `172.16.15.208/28`  | 16    | VPN Gateway 2    | -      |
| VPN Subnet 3     | `172.16.15.224/28`  | 16    | VPN Gateway 3    | -      |

> 💡 **Tip:** Clean IP boundaries simplify route tables and subnet associations.

---

## ⚙️ AWS VPC Best Practices

- 🔐 **Private Subnets**: Ideal for databases, microservices, and internal APIs.  
- 🌐 **Public Subnets**: Must have a route to an Internet Gateway (IGW).  
- 🔁 **TGW Subnets**: Use dedicated route tables for inter-VPC communication.  
- 🔄 **VPN Subnets**: Place them in dedicated subnets for better control and isolation.  
