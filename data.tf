data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "ubuntu2004" {
  name          = var.guest_vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "esxi-01" {
  name          = "esxi-01"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# data "vsphere_content_library" "library" {
#   name = "images"
# }

# data "vsphere_content_library_item" "ubuntu2004" {
#   name = var.guest_vm_template
#   type = "ovf"
#   library_id = data.vsphere_content_library.library.id
# }

# data "vsphere_ovf_vm_template" "ubuntu2004" {
#   name              = "ubuntu2004"
#   disk_provisioning = "thin"
#   resource_pool_id  = data.vsphere_resource_pool.pool.id
#   datastore_id      = data.vsphere_datastore.datastore.id
#   host_system_id    = data.vsphere_host.esxi-01.id
#   local_ovf_path    = "/path/to/ova" # ex. /home/{$USER}/Downloads/focal-server-cloudimg-amd64.ova
#   ovf_network_map = {
#     "VM Network" = data.vsphere_network.network.id
#   }
# }