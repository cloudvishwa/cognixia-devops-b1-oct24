 variable "tag_dep" {
    type = string
    default = "finance"   
 }

 variable "tag_owner" { }

 variable "tag_env" {
   validation {
     condition = contains(["dev", "uat", "prod"], var.tag_env)
     error_message = "The env vairables must be dev, uat or prod only"
   }
 }