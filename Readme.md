

# Creating VMs on Proxmox using Terraform and Cloud-init

## Preparation

You need a Proxmox server (You don't say!), a user who can create and configure VMs and a cloud-init enabled image ([This](https://github.com/runter-vom-mattenwagen/proxmox-packer)) will work).

Clone this repository.

You'll find the following file structure:

```
├── modules
│   └── infrastructure
│       ├── local_file.tf
│       ├── main.tf
│       ├── vars.tf
│       └── worker.tf
└── ubuntu-standard
    └── infrastructure.tf
```
    
Navigate to modules/infrastructure. Change pm_api_url, pm_user and pm_password to fit your environment. 

Then open vars.tf. Here you find the default values which are used to create a new vm. Variables without a default value must be set later. All variable can be overwritten from the environment file (infrastructure.tf). 

## New environment

"ubuntu-standard" is an example environment. Copy the directory including infrastructure.tf in the same directory to a name of your choice (e.g. "webserver") and open infrastructure.tf in vi (the files will destroy themselves when you try to edit them with nano). Change each value - except "source" - to your needs. 

## Running terraform

Stay in your new directory and run

```
$ terraform init
```

to let terraform preapre itself.


Afterward enter
```
$ terraform plan
$ terraform apply
```
to let terraform create your new VMs.


