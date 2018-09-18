locals{
 NetworkAdminsPolicyName="${var.env}_network_policy"
 ComputeAdminsPolicyName="${var.env}_compute_policy"
 StorageAdminPolicyName="${var.env}_storage_policy"
}

module "network_policy"{
 source="../policy"
 name="${local.NetworkAdminsPolicyName}"
 description="Policy for ${var.env} Network Administrators."
 policy_statement="${file("${path.module}/../json/network.json")}"
}

module "compute_policy"{
 source="../policy"
 name="${local.ComputeAdminsPolicyName}"
 description="Policy for ${var.env} Compute  Administrators."
 policy_statement="${file("${path.module}/../json/compute.json")}"
}

module "storage_policy"{
 source="../policy"
 name="${local.StorageAdminPolicyName}"
 description="Policy for ${var.env} Storage Administrators."
 policy_statement="${file("${path.module}/../json/storage.json")}"
}

