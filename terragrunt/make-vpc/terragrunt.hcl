include {
  path = find_in_parent_folders()
}

terraform {
    source = "${get_parent_terragrunt_dir()}/..//modules/creates_a_vpc"
}