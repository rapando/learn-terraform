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