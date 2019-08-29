module "my-tfe" {
  source = "./workspace"
  repo   = "mwhooker/my-tfe"
  name   = "my-tfe"

  organization          = tfe_organization.organization.id
  oauth_token_id        = tfe_oauth_client.oauth.oauth_token_id
}

module "tf-tfce-gcp" {
  source     = "./workspace"
  repo       = "mwhooker/tftest"
  name       = "gcp"
  auto_apply = false
  working_directory = "gcp"

  organization          = tfe_organization.organization.id
  oauth_token_id        = tfe_oauth_client.oauth.oauth_token_id
  GCP_CREDENTIALS       = var.GCP_CREDENTIALS
}

module "tf-tfce-aws" {
  source     = "./workspace"
  repo       = "mwhooker/tftest"
  name       = "aws-rds"
  auto_apply = false
  working_directory = "rds"

  organization          = tfe_organization.organization.id
  oauth_token_id        = tfe_oauth_client.oauth.oauth_token_id
  AWS_ACCESS_KEY_ID     = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
}
