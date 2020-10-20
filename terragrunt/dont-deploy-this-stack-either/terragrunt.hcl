include {
  path = find_in_parent_folders()
}

terraform {
    source = "${get_parent_terragrunt_dir()}/..//modules/creates_a_bucket"
}

dependency "other_stack" {
    config_path = "../dont-deploy-this-stack"
}

inputs = {
    vpc_name = dependency.other_stack.outputs.bucket
}