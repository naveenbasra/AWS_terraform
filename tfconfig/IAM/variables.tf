variable "env"{
 default	="dev"
}

variable "is_dev_env"{
 default	="false"
}

locals{
 env_map={
   prod="PROD"
   test="TEST"
   dev="DEV"
 }
 env_num="${local.env_map[var.env]}"
}

 