locals{
NetworkUserName="${var.env}_NetworkAdmiUser"
StorageUserName="${var.env}_StorageAdminUser"
ComputeUserName="${var.env}_ComputeAdminUser"
}
module user "users"
{
  source="../user"
  user_name="${local.NetworkUserName}" 
}

module user1 "users"
{
  source="../user"
  user_name="${local.StorageUserName}"
}

module user2 "users"
{
  source="../user"
  user_name="${local.ComputeUserName}"
}

