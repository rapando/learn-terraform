# Introduction.

[Terraform](http://terraform.io)

Language: HCL (Hashicorp Configuration Language)
File Extensions: *.tf

---

Resource in terraform is anything managed by terraform e.g a file, a vm, database.

Providers are kind of middleware that allow you to use terraform to create and manage resources.

---

### HCL Basics

A HCL file can have blocks and arguments. A block is defined within curly braces and arguments are in pairs.

```tf
<block> <parameters> {
    key1 = value1
    key2 = value2
}
```

For example, to create a file in a directory, we can do: [./terraform-local-file/local.tf](./terraform-local-file/local.tf)


---

A simple terraform workflow consists of 4 steps:

1. Write the config file.
2. Run `terraform init` command.
3. Run `terraform plan` command to review the execution plan
4. When ready, run `terraform apply` command.

When the tf file is updated, the resource is deleted and recreated (immutable)

If you want to destroy resources, run `terraform destroy`

---

## Providers
Providers are downloaded (as plugins) when `terraform init` is run.
They can be found on the [Terraform Registry](https://registry.terraform.io)

There are 3 tiers:

1. Provided and maintained by Hashicorp e.g. AWS, GCP, Local
2. Partner provider: owned and maintained by 3rd party which coordinate with Hashicorp e.g Digital Ocean, Heroku
3. Community providers: Individual contributors.

`terraform init` can be run any number of times.
Plugins are installed in `./terraform` directory.

The plugin name format is: `provider/type` e.g `hashicorp/local`

A plugin can be prefixed by the provider registry, if not set, it defaults to `registry.terraform.io`

By default, the latest version is installed. In case this might make breaking changes, specify the version.

---

## Configuration Directory.

You can have multiple .tf files. A single tf file can also have multiple config blocks e.g. `main.tf`

```tf
resource "local_file" "pet" {
    filename = "./pet.txt"
    content = "We love Pets!"
}

resource "local_file" "cat" {
    filename = "./cat.txt"
    content = "My favorite pet is Mr. Whiskers"
} 
```

We can also have the following config files:

| File Name | Purpose |
| --- | --- |
| `main.tf` | Main config file containing resource definition |
| `variables.tf` | Contains variable declaration |
| `outputs.tf` | Contains outputs from resources |
| `provider.tf` | Contains provider definitions |


---

## Multiple Providers and Resources
E.g local file and random to generate random pet names. Code in [multiple-providers](./multiple-providers/)


---

## Variables

Variables are set in `variables.tf`

```tf
variable "filename" {
    default = "/root/pets.txt"
    type = string # optional: string, number, bool, any (default)
    # other types: list, map, object, tuple
    description = "the description"
}

# list
variable "prefix" {
    default = ["Mr", "Mrs", "Sir"] # index begins at 0
    type = list # or list(string)
}

# usage
resource "local_file" {
    filename = var.filename
    content = var.prefix[0]
}

# maps
variable file-content {
    type = map # or map(string) : data type is of the value not key
    default = {
        "statement1" = "We love pets!"
        "statement2" = "We love animals!"
    }
}

# usage
var.file-content["statement1"]

# sets are same as lists only that the values don't repeat e.g
variable "prefix" {
    type = set(string)
    default = ["Mr", "Mrs"]
}

# objects : complex data structures
variable "bella" {
    type = object({
        name = string
        color = string
        age = number
        food = list(string)
        favorite = bool
    })
    default = {
        name = "Bella"
        color = "Black"
        age = 1
        food = ["Fish", "Chips"]
        favorite = true
    }
}

# tuple similar to list, but can have multiple data types
variable kitty {
    type = tuple([string, number, bool])
    default = ["cat", 7, true]
}
# usage:
var.kitty
```

to use it in `main.tf`

```tf
resource "local_file" "pet" {
    filename = var.filename
    content = "Using variables"
}
```

To make updates, you can just make changes to the variables.tf and the main.tf won't be changed. This is important if you're setting up the same resources with different names, specs etc for dev and production.