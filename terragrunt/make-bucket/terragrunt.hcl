include {
  path = find_in_parent_folders()
}

terraform {
    source = "${get_parent_terragrunt_dir()}/..//modules/creates_a_bucket"
}

dependency "vpc" {
    config_path = "../make-vpc"
}

inputs = {
    vpc_name = dependency.vpc.outputs.vpc_name
}