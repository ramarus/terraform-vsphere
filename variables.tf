variable "vsphere_user" {
  type        = string
  description = ""
}

variable "vsphere_password" {
  type        = string
  description = ""
  sensitive   = true
}

variable "vsphere_server" {
  type        = string
  description = "value"
}

variable "vsphere_datacenter" {
  type        = string
  description = ""
}

variable "vsphere_datastore" {
  type        = string
  description = ""
}

variable "vsphere_resource_pool" {
  type        = string
  description = ""
}

variable "vsphere_network" {
  type        = string
  description = ""
}

variable "guest_id" {
  type        = string
  description = ""
}

variable "guest_vm_template" {
  type        = string
  description = ""
}

# Master parameters
variable "masters_count" {
  type        = number
  description = ""
}

variable "master_num_cpus" {
  type        = number
  description = ""
}

variable "master_memory" {
  type        = number
  description = ""
}

variable "master_disk_size" {
  type        = number
  description = ""
}

variable "master_disk_label" {
  type        = string
  description = ""
}

# Worker parameters
variable "workers_count" {
  type        = number
  description = ""
}

variable "worker_num_cpus" {
  type        = number
  description = ""
}

variable "worker_memory" {
  type        = number
  description = ""
}

variable "worker_disk_size" {
  type        = number
  description = ""
}

variable "worker_disk_label" {
  type        = string
  description = ""
}

# DBnode parameters
variable "dbnodes_count" {
  type        = number
  description = ""
}

variable "dbnode_num_cpus" {
  type        = number
  description = ""
}

variable "dbnode_memory" {
  type        = number
  description = ""
}

variable "dbnode_disk_size" {
  type        = number
  description = ""
}

variable "dbnode_disk_label" {
  type        = string
  description = ""
}

variable "dbnode_data_disk_size" {
  type        = number
  description = ""
}

variable "dbnode_data_disk_label" {
  type        = string
  description = ""
}