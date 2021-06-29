# Automatic setup of new IBM Cloud accounts

## Description

TL;DR - Terraform scripts to automatically create key & required [IBM Cloud](https://cloud.ibm.com/) services for a new [IBM Garage](https://www.ibm.com/uk-en/garage) engagement.

I work as part of the [IBM Garage](https://www.ibm.com/uk-en/garage) where we run multiple projects a month across a wide variety of technologies and services. Where possible, we like to use the IBM Cloud to run these projects for obvious reasons. For each project we setup a new [IBM Cloud](https://cloud.ibm.com/) account. However upon reflection across a number of projects we found that there were some consistent challenges that we were facing:

1. Not every account was setup following best practices - this lead to issues down the line
2. Identity and access management is critical, yet could sometimes be overlooked - this lead to user permission errors and possible security issues
3. It could take a while to setup an account for team members who are new to the IBM Cloud

In classic SRE fashion we recognised the ability to negate these issues through automation by standardising the new account setup process. This repo contains the terraform scripts which will automate the creation of the IAM groups, add users, create best practice tools e.g. [Activity Tracker](https://cloud.ibm.com/docs/activity-tracker?topic=activity-tracker-getting-started) and even create a [ROKS](https://cloud.ibm.com/docs/openshift?topic=openshift-getting-started) cluster for you to get started with a Cloud Pak project.

## Features

- Access Groups
  - Creates an `Admin` access group with full account permissions
- Users
  - Adds a pre-populated list of users
- Logging & Monitoring
  - Creates a platform level `LogDNA`, `SysDig` and `Activity Tracker` instance

## Getting an IBM Cloud account

As this entire repo is dedicated to automating the first steps of an IBM Cloud account, it makes sense that you will need one before you can use anything here.

1. Create an IBM Cloud account
   - [IBMers can create a PoC account](https://ibm.box.com/s/n8bnzzh6e7fmtnnk7bhwpu777kvh9xwr)
   - Clients can use their own accounts to retain ownership and control of the project
2. [Create an IBM Cloud API key](https://cloud.ibm.com/docs/account?topic=account-userapikey#create_user_key)

Once complete you can move on to getting Terraform working. You have a few options:

1. [Running Terraform locally](#getting-started-with-terraform-locally)
2. [Using IBM Cloud Schematics - Terraform-as-a-service](#getting-started-with-ibm-cloud-schematics)

IBM Cloud Schematics requires less configuration and enables you to get started more quickly. However local development is quicker if you intend to edit and test the Terraform scripts.

## Getting started with Terraform locally

### Prerequisites

1. [Download the Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli) - Minimum version `v0.15.4`

## Getting started with IBM Cloud Schematics

### Prerequisites

1. [Create an IBM Cloud Schematics instance in your account](https://cloud.ibm.com/docs/schematics?topic=schematics-get-started-terraform)
2. Fork this repo & copy/store the URL, or copy/store this repo's URL (to be used in the next step)
3. [Create a workspace in your IBM Cloud Schematics instance](https://cloud.ibm.com/docs/schematics?topic=schematics-workspace-setup)

## Usage

tbd

## Support

tbd

## Roadmap

- Auto-deployment of a ROKS cluster

## Contributing

tbd

## License

Distributed under the MIT License. See LICENSE for more information.

## Contact

Creator: Brian Say
Email: brian.say2@uk.ibm.com

## Acknowledgements

[IBM Cloud Terraform Provider](https://github.com/IBM-Cloud/terraform-provider-ibm)

[IBM CP4D Deployment](https://github.com/IBM/cp4d-deployment/tree/master/managed-openshift/ibmcloud) - A massive inspiration