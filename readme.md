# Terraform functions
We've used functions such as length, file etc.
Terraform provides a console for testing functions.

```sh
terraform console
```

It is loaded in the context of the project and we can use the console to test the output of a function.
Copy the function call and paste it in the console.

## Types of functions
- Numeric: transform and manipulate function e.g max, min `max(var.num...)`, ceil, floor
- String: manipulate/ transform string data e.g. `split(",", "fd,fd,fd")`, lower, upper, title, `substr(var.ami, 16,7)`, join
- Collection : manipulates sets, maps and lists. `index(var.ami, "AMI-X")`, `keys(var.ami)` converts keys in a map to a list. `values(var.ami)` does hte same for values, `lookup(var.ami, "ca-central-1)` returns value for key. `lookup(var.ami, "key", "default-return")`
- Type conversion

# Conditional Expressions
values are type sensitive
```sh
8 == 8
8 != 7
6 <= 7
10 >= 1
```

## Logical Expressions

```sh 
8 > 7 && 8 < 10
```

```tf
resource "random_password" "password-generator" {
    length = var.length < 8 ? var.length : 8 # if length < 8  then we use 8 as default.
}

output "password" {
    value = random_password.password-generator.result
}

variable length {
    type = number
    description = "The length of the password"
}
```


# Terraform Workspaces.
Terraform state stores the current status of the infrastructure.
We can have the same directory to create different infra

```sh
terraform workspace new ProjectA
```

List
```sh
terraform workspace list
```

We can then create a map variable with values whose keys are the workspace names.
We then reference this as

```tf
ami = lookup(var.ami, terraform.workspace)
```

This is important in situations such as configuring dev and prod environments, similar in structure but with different specs.

Create a workspace

```sh
terraform workspace create workspace-name
```

Switch workspaces

```sh
terraform workspace select ProjectA
```

With multiple workspaces, states are stored in the `terraform.tfstate.d` directory. In each, there's a directory containing the tfstate for each workspace.