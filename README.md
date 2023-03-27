
![image](https://user-images.githubusercontent.com/62203157/227891819-d7abc33a-d6fc-4de4-a9b6-6d1cbebf18ad.png)





Hashicorp Terraform is an open-source IaC (Infrastructure-as-Code) tool for provisioning and managing cloud infrastructure. It codifies infrastructure in configuration files that describe the desired state for your topology. Terraform enables the management of any infrastructure - such as public clouds, private clouds, and SaaS services - by using Terraform providers.

Terraform providers for Azure infrastructure

There are several Terraform providers that enable the management of Azure infrastructure:

AzureRM: Manage stable Azure resources and functionality such as virtual machines, storage accounts, and networking interfaces.
AzureAD: Manage Azure Active directory resources such as groups, users, service principals, and applications.
AzureDevops: Manage Azure DevOps resources such as agents, repositories, projects, pipelines, and queries.
AzAPI: Manage Azure resources and functionality using the Azure Resource Manager APIs directly. This provider compliments the AzureRM provider by enabling the management of Azure resources that aren't released. For more information about the AzAPI provider, see Terraform AzAPI provider.
Azure Stack: Manage Azure Stack resources such as virtual machines, DNS, VNet, and storage.


Benefits of Terraform with Azure:

Terraform Azure providers enable you to manage all of your Azure infrastructure using the same declarative syntax and tooling. Using these providers you can:

Provision core platform capabilities such as management groups, policies, users, groups, and policies. For more information, see Terraform implementation of Cloud Adoption Framework Enterprise-scale.
Provision Azure DevOps Projects and pipelines to automate regular infrastructure and application deployments.
Provision Azure resources required by your applications.
Automate infrastructure management
The Terraform template-based configuration file syntax enables you to configure Azure resources in a repeatable and predictable manner. 

Automating infrastructure includes the following benefits:

Lowers the potential for human errors while deploying and managing infrastructure.
Deploys the same template multiple times to create identical development, test, and production environments.
Reduces the cost of development and test environments by creating them on-demand.


