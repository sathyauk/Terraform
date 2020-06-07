variable "resource_group" {
  default = "jpa"
}

variable "location" {
  default = "North Europe"
}

variable "vnetname" {
  default = "jpa-vnet"
}

variable "keyvaultnames" {
  description = "names of all Keyvaults to be created in this environment"
  type = "list"
  default = ["jpakv18sd9","jpakv18s454","jpakv18erwe"]
}

variable "cordanic" {
  description = "names of all nic to be created in this environment"
  type = "list"
  default = ["jpavmnic189","jp8avmnic18","jpavmnic187"]
}

##### An array if variables holding dns virtual machines ##### 
variable "dnsvmnames"{
  description = "values of all dns virtual machine names"
  type = "list"
  default = ["jpaser898-VM","operatordns2-VM"]
}

##### Define variables for VM Username #####  
variable "vmuser" {
  default = "bcadmin"
}
variable "vmpassword" {
  default = "1ON5YFbu6o%z"
}

variable "pipnames" {
  type = "list"
  default = ["jpaserverpip987", "jpaserverpip5656"]
}

# create variable for SQL
variable "sqlserver" {
   default = "jpasql9898"
}

#create variable for sql DB
variable "sqldbnames" {
  type = "list"
  default = ["jpasqldbonline", "jpasqldboffline"]
}

