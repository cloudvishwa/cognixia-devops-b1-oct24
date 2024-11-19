## This example is to add variables 

Variable precedence 
 * Command line 
 * terraform.tfvars
 * environment variables
 * variables.tf 

## Command Line example 
The vars.tf file has 2 variables defined 
```
terraform plan -var tag_dep="HR" -var tag_owner="Vish"
```

## 