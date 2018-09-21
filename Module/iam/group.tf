locals{
 NetworkAdminName="${var.env}_network"
 ComputeAdminName="${var.env}_compute"
 StorageAdminName="${var.env}_storage"
}

module "network"{
 source="../group"
 name="${local.NetworkAdminName}"
 description="Policy for ${var.env} Network Administrators."
 policy_statement="${file("${path.module}/../json/network.json")}"
}

module "compute"{
 source="../group"
 name="${local.ComputeAdminName}"
 description="Policy for ${var.env} Compute  Administrators."
 policy_statement="${file("${path.module}/../json/compute.json")}"
}

module "storage"{
 source="../group"
 name="${local.StorageAdminName}"
 description="Policy for ${var.env} Storage Administrators."
 policy_statement="${file("${path.module}/../json/storage.json")}"
}

