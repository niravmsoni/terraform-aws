provider "aws"{
    region = "us-east-1"
    # Not recommended to hard-code creds here
    access_key = ""
    secret_key = ""
    # Have credentials in a credential file
    shared_credentials_file = "/users/nirav/.aws/creds"
    # Export environment variables and use them
}