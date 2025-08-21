# EC2
EC2: Elastic Cloud Compute
AMI: Amazon Machine Image (each image has an id)
Instance type: depends on the type of workload.
    General use, compute, memory optimised etc

EBS (Elastic Block Storage) storage for these instance types. These storages are attached to the instance.

User data can be passed e.g a script to deploy applications e.g nginx
We use ssh keys to access the instance

The provisioner for local exec is used to save info locally, e.g the public ip of the instance that was created. The remote-exec is run on the instance.

Use provisioners sparingly.


# Terraform Taint
Terraform marks a resource as tainted if it fails to apply e.g because a provisioner failed.
If we want to recreate a resource we can taint it so that it will not  recreated in the next apply.

untaint untaints a previous taint.

## Log Levelts
```tf
export TF_LOG=TRACE terraform apply
```

# Terraform Import
Import existing infrastructure into terraform config. For example, existing servers and dbs that were created elsewhere.

```sh
terraform import <resource_type>.<resource_name> <attribute>
# e.g.
terraform import aws_instance.webserver-2 i-jkvsdhvbfj
```

this does not update the configs (they are in tfstate- check new version)