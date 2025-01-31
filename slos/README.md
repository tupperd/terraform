# Terraform Example: Creating a Grafana Cloud SLO

This repository demonstrates how to define and deploy a Service Level Objective (SLO) in [Grafana Cloud](https://grafana.com/docs/grafana-cloud/) using Terraform’s [Grafana Provider](https://registry.terraform.io/providers/grafana/grafana/latest/docs). By following the steps below, you can replicate this process on your own Grafana Cloud instance.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Repository Structure](#repository-structure)

---

## Overview

This project contains Terraform configuration files to:
1. **Initialize a Grafana provider** pointing to your Grafana Cloud instance.
2. **Create a Ratio-based SLO** in Grafana Cloud, including **burn rate alerts**.

Once applied, you’ll have an SLO called **“Tupper - Terraform Ratio Query Example”** that evaluates a ratio of `success_metric` to `total_metric` over a 30-day window. You’ll also have two types of burn rate alerts—**fastburn** and **slowburn**—which will help you catch error budget issues in real time.

---

## Prerequisites

1. **Terraform**  
   - [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) (v0.14 or later recommended).

2. **Grafana Cloud Account**  
   - You need an existing [Grafana Cloud](https://grafana.com/docs/grafana-cloud/get-started/) instance.

3. **Grafana API Token**  
   - This token must have the necessary permissions (e.g., admin-level or specific permissions to create SLOs/alerts).  
   - [How to create a Grafana Cloud API token](https://grafana.com/docs/grafana/latest/administration/service-accounts/).

---

## Repository Structure

- **`main.tf`**  
  Declares the Terraform and Grafana provider configuration, including a placeholder for the Grafana Cloud URL and the `grafana_api_token` variable.

- **`slo.tf`**  
  Defines the SLO resource (`grafana_slo`) with:
  - **Ratio query** metrics (`success_metric` and `total_metric`).  
  - Labels and annotations for alerting.  
  - Objectives and burn rate alert configurations.

- **`secrets.tfvars`**  
  Contains your **API token** (and potentially other secrets). **Do not commit** this file to source control.
