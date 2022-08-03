

# Creating VMs on Proxmox using Terraform and Cloud-init

Approach was to define a VM-standard for my environment and keep the effort low to generate new machines.

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

Navigate to _modules/infrastructure_. Change in _main.tf_ the values for _pm_api_url_, _pm_user_ and _pm_password_ to match your environment.

Then open _vars.tf_. Here you find the default values used to create a new VM. Variables without default value must be set later. All variables can be overwritten in the environment file (_infrastructure.tf_).

## New environment

"ubuntu-standard" is a sample environment. Copy the directory including _infrastructure.tf_ in the same directory to a name of your choice (e.g. "webserver") and open _infrastructure.tf_ in vi or vim. Change every value - except "source" - according to your needs.

## Running terraform

Stay in your new directory and run:
```
$ terraform init
```

to let terraform prepare itself.

Followed by:
```
$ terraform plan
$ terraform apply
```
to let terraform create your new VMs.
