locals{
NetworkGroupName="${var.env}_NetworkAdmiGroup"
StorageGroupName="${var.env}_StorageAdminGroup"
ComputeGroupName="${var.env}_ComputeAdminGroup"
}
module group "groups"
{
  source="../group"
  group_name="${local.NetworkGroupName}" 
}

module group1 "groups"
{
  source="../group"
  group_name="${local.StorageGroupName}"
}

module group2 "groups"
{
  source="../group"
  group_name="${local.ComputeGroupName}"
}

