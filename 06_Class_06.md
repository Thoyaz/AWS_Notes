# 🚀 AWS Networking: Flow Logs & VPC Peering

---

## 📌 Agenda
1. **Flow Logs** – Capture traffic within your VPC
2. **VPC Peering** – Connect VPCs for cross-communication

---

## 📊 Flow Logs

Flow Logs help monitor network traffic going in and out of your VPC resources.

### 🔧 Flow Logs Can Be Applied At:
- **VPC Level**
- **Subnet Level**
- **Network Interface Level**

> 💡 **Tip:** If we apply Flowlogs on VPC Level, that means we are storing the logs on that entire VPC, means what it will store logs from VPC, Subnets under that VPC and service logs in that VPC will be logged

---

### 🛢️ Flow Log Storage Options:
- 📁 **Amazon S3 Bucket**
- 📊 **Amazon CloudWatch Logs**

---

## 🧪 Lab: Storing VPC-Level Flow Logs into S3

### ✅ Steps:

1. **Create S3 Buckets**
   - Create **two buckets** (for future use):
     - One for **fully qualified domain** (e.g. `logs.example.com`)
     - One for **naked domain** (e.g. `example.com`)

2. **Create VPC Flow Logs:**
   - Go to **VPC Dashboard**
   - Click **Flow Logs**
   - Provide a name for your flow log
   - Select **Log Format**: `All`
   - Set **Max Aggregation Interval**: `1 minute`
   - Set **Destination**: `S3`
   - Paste the **S3 Bucket ARN** (find this in S3 → Properties → ARN)
   - Click **Create Flow Log**

> ✅ Once created at the VPC level, flow logs will **automatically attach** to all associated **subnets and services**.

### 🔍 Example:
- Check any subnet under the VPC — it will now be logging traffic via the flow log.

---

## 🔄 VPC Peering

By default, **VPCs are isolated**. You need **VPC Peering** to allow private communication between VPCs.

### ⚠️ Peering Rules:
- VPCs **must NOT** have **overlapping IP ranges**
- **No transitive peering** (A ↔ B ↔ C does not allow A ↔ C)

---

## 🧪 VPC Peering Lab

![VPC Peering Diagram](./Images/VPC_Peering_P1.png)

### 🏗️ Setup:

1. Create **three VPCs**, each with its own subnet
2. Launch **one EC2 instance** in each VPC
3. Try to ping across VPCs → ❌ **It won’t work (yet)**

---

### 🔗 Create Peering Between VPC-1 and VPC-2

1. Go to **VPC → Peering Connections**
2. Click **Create Peering Connection**
3. Provide a name
4. Select:
   - **Local VPC**: VPC-1
   - **Peer VPC**: VPC-2 (select `My Account`)
5. Click **Create Peering**

> 🕓 Status will be **Pending**

6. Go to **Actions → Accept Request** to make it **Active**

7. **Update Route Tables**:
   - Go to **Route Tables**
   - For both VPC-1 and VPC-2, add a route to each other's CIDR via the **Peering Connection**

---

## 💬 Additional Notes

### 🌐 Network Interface (ENI)
- Acts like a **virtual network card** for EC2 and other AWS services
- Most AWS services attach a **network interface** for communication
- Think of it like a **WiFi adapter** in your laptop

---

## 💰 Pricing Note
- **VPC Peering itself is free**
- **Data transfer across peered VPCs is chargeable**

---

