 variable "tag_dep" {
    type = string
    default = "finance"   
 }

 variable "tag_owner" { }

 variable "location" {
   
 }

 variable "loc_as" {
   type = map
   default = {
      "East US" = "10.10.0.0/16"
      "West US" = "10.11.0.0/16"
   }
 }

 variable "subnets" {
   type = map
 }