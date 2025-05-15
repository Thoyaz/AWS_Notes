# 🔒 AWS Network Firewall Lab Guide

## 📝 Agenda

1. **AWS Network Firewall**
2. **Buy a Domain and Configure it with Route53** *(To be covered later)*

---

## 🚀 Use Case: Web Page Blocking Using AWS Network Firewall

If you want to **block access to websites** like **YouTube**, **Facebook**, **SBI Bank**, etc., while still allowing access to specific domains (e.g., Google), you can use **AWS Network Firewall**.

---

## 🧪 Lab: Blocking YouTube using AWS Network Firewall

### 🛠️ VPC Setup

* **VPC CIDR:** `10.1.0.0/16`
* **Subnets:**

  * `ProtectedSubnet`: `10.1.10.0/24` *(Private subnet for the instance)*
  * `FirewallSubnet`: `10.1.1.0/24` *(Public subnet for firewall endpoint)*

---

### 🧩 EC2 Instance Setup

* Launch a **Windows Server** in `ProtectedSubnet`
* **Enable Auto-Assign Public IP**
* **Security Group:** Allow **All Traffic**
* **Connect via RDP** after instance is running

> 🟡 *Ensure RDP Port (3389) is open in the security group*

---

## 🔥 Step-by-Step: AWS Network Firewall Configuration

### 1. **Create Network Firewall Rule Groups**

* Navigate to:

  ```
  VPC -> Network Firewall -> Rule groups
  ```
* Create two **stateful rule groups**:

  * **Allow Only Google**
  * **Block All Others**

> ✅ Start with allowing only google.com to validate firewall blocking behavior.

---

### 2. **Configure Rule Group (Allow Google)**

* Rule Type: **Stateful**
* Domain list rule to allow only `google.com`
* Add additional rules later for YouTube/Facebook/SBI as needed

---

### 3. **Firewall Policy Creation**

* Navigate to:

  ```
  VPC -> Network Firewall -> Firewall Policies -> Create
  ```
* Attach previously created rule groups
* Click **Create Firewall Policy**

> 🔴 *Don’t skip this step – policy links rule groups to actual firewall deployment.*

---

### 4. **Deploy the Firewall**

* Go to:

  ```
  VPC -> Network Firewall -> Firewalls -> Create Firewall
  ```
* Attach:

  * Firewall policy
  * `FirewallSubnet`
  * Logging configuration (optional, for insights)
* **Deployment takes \~15 minutes**

---

### 5. **Configure Routing**

#### 🔁 Route Table Setup

* **ProtectedSubnet RT:**

  * Route `0.0.0.0/0` → **Firewall ENI** (e.g., `eni-xxxxxx`)
* **FirewallSubnet RT:**

  * Route `0.0.0.0/0` → **Internet Gateway (IGW)**
* **IGWIngressSubnet RT:**

  * Route `ProtectedSubnet CIDR` → **Firewall ENI**

> ⚠️ *This step is **critical**. Misconfigured routes = firewall won't inspect traffic properly.*

---

## 🧪 Validate Your Setup

* RDP into the Windows EC2 instance
* Open browser:

  * ✅ Access **Google**
  * ❌ Blocked: **YouTube, Facebook, SBI**

---

## ✅ Allowing More Websites

To allow access to additional domains (e.g., YouTube):

* Go to:

  ```
  VPC -> Network Firewall -> Rule Groups -> [Your Rule Group]
  ```
* Edit rule group and add domain(s)
* Save and redeploy (if needed)

---

## 🌐 ICMP (Ping) Not Working?

* By default, **ICMP** (e.g., `ping google.com`) is blocked.
* Create a new **stateless rule group** to allow **ICMP protocol**.

---

## 📂 Enable Logging (Optional but Recommended)

* Go to:

  ```
  VPC -> Network Firewall -> Firewalls -> Logging Configuration
  ```
* Choose **CloudWatch Logs** or **S3**
* Logs help in troubleshooting and traffic auditing

---

## 🧹 Lab Cleanup (IMPORTANT)

1. **Delete Route Table Entries**
2. **Delete the Firewall**
3. **Terminate the EC2 Instance**

> 🧼 *Always clean up AWS resources to avoid unexpected charges.*

---

## 📌 Important Notes

* 🧱 AWS Network Firewall **only supports domain-based filtering** with FQDNs (fully qualified domain names).
* 🕒 Firewall provisioning may take **15–20 minutes**, be patient.
* 🔐 Make sure to allow **RDP** in the security group for Windows instances.
* 🧠 Rule updates require **policy redeployment** or **reloading** to take effect.
* 📶 Domain name rules resolve periodically, **not in real-time**. You may need to wait for DNS refresh if newly allowed domains are not accessible immediately.

---

## 🗂️ Useful AWS Console Paths

| Task                   | Console Path                                      |
| ---------------------- | ------------------------------------------------- |
| Create Rule Group      | `VPC -> Network Firewall -> Rule groups`          |
| Create Firewall Policy | `VPC -> Network Firewall -> Firewall policies`    |
| Deploy Firewall        | `VPC -> Network Firewall -> Firewalls`            |
| Logging                | `VPC -> Network Firewall -> Firewalls -> Logging` |
| Route Tables           | `VPC -> Route Tables`                             |

---

## 🏁 Conclusion

With this setup, you now have:

* A working **firewall-based filtering** system in AWS
* The ability to **block or allow** traffic on a per-domain basis
* Insight into network behavior with **logging**

Next steps: Configure custom domains using **Route53** (covered in the next section).
