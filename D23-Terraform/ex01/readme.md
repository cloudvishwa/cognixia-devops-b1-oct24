## Scenario1

* change the address space to "10.20.0.0/16", and add 2 subnets, 10.20.1.0/24, and 10.20.2.0/24" 
* do the terraform plan.

## Scenario-2

* Create
  * Resource group
  * vnet -- 192.168.0.0/19, with 80 ips per network and 3 subnets
  * 1 VM in the first subnet with addition datadisk of 2 GB ( linux vm)
  * 1 VM in the 2nd subnet with addition datadisk of 2 GB ( Win11 vm)
