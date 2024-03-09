## ARJ-Stack: Amazon Bedrock - KnowledgeBase to implement RAG workflow

This repository is a walkthrough (along with code) for the usage of knowledge Base with Amazon bedrock Service and Amazon OpenSearch Serverless to implement Retrieval Augmented Generation (RAG) workflow, for generating more relevant, accurate and customized responses using private data sources.

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_awscli"></a> [awscli](#requirement\_awscli) | 2.15.21 |
| <a name="requirement_python"></a> [python](#requirement\_python) | 3.12.2 |
| <a name="requirement_poetry"></a> [poetry](#requirement\_poetry) | 1.7.1 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |

### Terraform Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.39.0 |

### Pre-requisites?

Access to Foundation Models on Amazon bedrock console. This is a simple step which you can perform on Amazon Bedrock console directly by visiting Model Access menu.

### How to run POC?
---

The POC is divided in 2 steps. Step1 is to provision base infrastructure using terraform and Step 2 is to play around Knowledge Base related resources using Python

#### Step #1: Provision Infrastructure using Teraform

Follow the following steps to provision necessary infrastructure: 

- Configure AWS profile named "bedrock-profile". Refer [provider.tf](https://github.com/ankit-jn/amazon-bedrock-knowledge-base/blob/main/infra/providers.tf#L19)
- Go to [infra](https://github.com/ankit-jn/amazon-bedrock-knowledge-base/tree/main/infra) directory
- Run the following commands:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

The following resources will be provisioned in `us-east-1` AWS region as an outcome of the above steps

| Sr. No. | Resource Type | Resource Name |
|:------|:------|:------|
| 1 | IAM Policy | `kb-policy-bedrock-foundation-model` |
| 2 | IAM Policy | `kb-policy-datasource-bucket` |
| 3 | IAM Policy | `kb-policy-opensearch-serverless` |
| 4 | IAM Role | `kb-role-bedrock-execution` |
| 5 | Policy Attachment | The Policy `kb-policy-bedrock-foundation-model` will be attched to IAM role `kb-role-bedrock-execution` |
| 6 | Policy Attachment | The Policy `kb-policy-datasource-bucket` will be attched to IAM role `kb-role-bedrock-execution` |
| 7 | OSS Encryption Policy | `kb-oss-encryption-sec-policy` |
| 8 | OSS Network Access Policy | `kb-oss-network-sec-policy` |
| 9 | OSS Data Access Policy | `kb-oss-data-access-policy` |
| 10 | OpenSearch Serverless Collection | `kb-oss` |
| 11 | S3 Bucket | `arjstack-kb-data-source` |

#### Step #2: Drive Knowledge Base Code using Python

Follow the following steps to provision necessary resources:
- Go to [knowledge_base](https://github.com/ankit-jn/amazon-bedrock-knowledge-base/tree/main/knowledge_base) directory
- Create a Virutal Environment: `python -m venv .venv`
- Activate the created environment: `.venv\Scripts\activate.bat`
- Run the command `poetry install`
- [main.py](https://github.com/ankit-jn/amazon-bedrock-knowledge-base/blob/main/knowledge_base/main.py) Execution Entry of the program

#### Operations
---
- Upload Data in S3
- Create Vector Index in OSS Collection
- Create Knowledge Base
- Create Datasource in Knowledge Base
- Ingestion in Datasource (Embedding generation)
- List Knowledge Bases
- List KB datasources
- Test Knowledge Base (With RetrieveAndGenerate API)
- Test Knowledge Base (With Retrieve API)
- Cleanup Resources

The following resources will be provisioned in `us-east-1` AWS region as an outcome of the above steps

| Sr. No. | Resource Type | Resource Name |
|:------|:------|:------|
| 1 | Vector Index | `kb-oss-index` |
| 2 | Knowedge Base | `arjstack-kb` |
| 3 | KB-Data Source | `arjstack-kb-data-source` |

#### Reference Data
---
We have collected reference material regarding Hydrogen energey as a reference for setting up contexts and put it in [data](https://github.com/ankit-jn/amazon-bedrock-knowledge-base/tree/main/data) folder

- I would like to thank the authors of the above reference materials.This is to bring in notice that we are not using these reference material for any monetary purpose. It is just for the eductional use of showing how the documents can be used to set the context for generating relevant responses using RAG workflow.

### Authors

Module is maintained by [Ankit Jain](https://github.com/ankit-jn) with help from [these professional](https://github.com/ankit-jn/amazon-bedrock-knowledge-base/graphs/contributors).
