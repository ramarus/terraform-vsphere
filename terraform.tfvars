vsphere_user          = "administrator@vsphere.local"
vsphere_password      = "SuperSecretPasswordForVSphere"
vsphere_server        = "vcsa.yourdomain.com"
vsphere_datacenter    = "dc1"
vsphere_datastore     = "iSCSI"
vsphere_resource_pool = "esxi-01/Resources"
vsphere_network       = "VM Network"
guest_id              = "ubuntu64Guest"
guest_vm_template     = "ubuntu2004"

# Master node parameters
masters_count     = 1
master_num_cpus   = 2
master_memory     = 2048
master_disk_size  = 32
master_disk_label = "disk0"

# Worker node parameters
workers_count     = 1
worker_num_cpus   = 4
worker_memory     = 8192
worker_disk_size  = 32
worker_disk_label = "disk0"

# DB node parameters
dbnodes_count          = 1
dbnode_num_cpus        = 4
dbnode_memory          = 8192
dbnode_disk_size       = 32
dbnode_disk_label      = "disk0"
dbnode_data_disk_size  = 128
dbnode_data_disk_label = "disk1"