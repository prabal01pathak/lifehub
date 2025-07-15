# 🌐 LifeHub Infrastructure — Terraform on Azure

This repository contains the Terraform configuration for provisioning core infrastructure on Azure, including a production-ready **AKS (Azure Kubernetes Service)** cluster, networking, identity, and secrets integration.

---

## ⚙️ Features

- ✅ Azure Resource Group, VNet, and Subnet provisioning
- ✅ AKS Cluster with:
  - System-assigned identity
  - Private subnet deployment
  - OIDC integration
  - Key Vault CSI Secrets Provider
- ✅ Parameterized configuration via input variables
- ✅ Remote state backend (Azure Storage)
- ✅ Tagging for environment classification

---

## 📁 Directory Structure

```bash
apps/infrastructure/terraform/src
├── main.tf               # Core resource definitions
├── variables.tf          # Input variable schema
├── outputs.tf            # Resource outputs
├── providers.tf          # Azure provider setup
├── backend.tf            # Remote state backend config (param-driven recommended)
├── .terraform.lock.hcl   # Provider dependency lock
└── README.md             # This file
```
