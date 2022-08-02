terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.1.1"
    }
  }
}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

resource "vsphere_virtual_machine" "master" {
  count            = var.masters_count
  name             = "k8s-master-${count.index + 1}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.master_num_cpus
  memory   = var.master_memory
  guest_id = var.guest_id

  vapp {
    properties = {
      hostname  = "k8s-master-${count.index + 1}"
      user-data = base64encode(file("${path.module}/vm_configs/master.userdata.yaml"))
    }
  }

  cdrom {
    client_device = true
  }

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = var.master_disk_label
    size  = var.master_disk_size
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.ubuntu2004.id
  }
}

resource "vsphere_virtual_machine" "worker" {
  count            = var.workers_count
  name             = "k8s-worker-${count.index + 1}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.worker_num_cpus
  memory   = var.worker_memory
  guest_id = var.guest_id

  vapp {
    properties = {
      hostname  = "k8s-worker-${count.index + 1}"
      user-data = base64encode(file("${path.module}/vm_configs/worker.userdata.yaml"))
    }
  }

  cdrom {
    client_device = true
  }

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = var.worker_disk_label
    size  = var.worker_disk_size
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.ubuntu2004.id
  }
}

resource "vsphere_virtual_machine" "dbnode" {
  count            = var.dbnodes_count
  name             = "k8s-dbnode-${count.index + 1}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.dbnode_num_cpus
  memory   = var.dbnode_memory
  guest_id = var.guest_id

  vapp {
    properties = {
      hostname  = "k8s-dbnode-${count.index + 1}"
      user-data = base64encode(file("${path.module}/vm_configs/dbnode.userdata.yaml"))
    }
  }

  cdrom {
    client_device = true
  }

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = var.dbnode_disk_label
    size  = var.dbnode_disk_size
  }

  disk {
    label       = var.dbnode_data_disk_label
    size        = var.dbnode_data_disk_size
    unit_number = 1
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.ubuntu2004.id
  }
}