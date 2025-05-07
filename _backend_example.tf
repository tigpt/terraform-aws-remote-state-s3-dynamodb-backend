##Example of a backend configuration with new State Locking Feature

# terraform {
#   backend "s3" {
#     region         = "eu-west-1"
#     bucket         = "tf-test-5895-state"
#     key            = "state.backend.tfstate"
#     encrypt        = true
#     profile        = "trc"
#     use_lockfile   = true
#   }
# }