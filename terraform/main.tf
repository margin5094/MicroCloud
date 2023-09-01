resource "google_container_cluster" "my_cluster" {
  name               = "cost-optimized-cluster-1"
  location           = "us-central1-a"
  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 25
  }
}
provider "google" {
  credentials = var.credentials_json
  project     = "fleet-garage-389620"
  region      = "us-central1"
}

variable "credentials_json" {
  type    = string
  default = <<EOT
{
  "type": "service_account",
  "project_id": "fleet-garage-389620",
  "private_key_id": "63394aca7eff3bcc2ac0c31728f4cd57bc134234",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDSC1cliGsMFBGg\nNLL9wNzU1f4YEKWNzlrO5rfI7kGXXRH64bfc9Ofpuvt//aipFIBQ5/kEtiJYsmDC\noRbz2q9aZ+gqID30oenehBNfSx8HpHw+adOmLS1hE8XOqhcU2f0a3/vMPdyuweYw\nWN1g4ayQX1yI53R6XKFQfmmCKEy4XXcZkq89nFZShF/UGCKwqy6FEbwPjv8fpm3i\nuo3Nrq7DlclGN2sOtL38sNo337NPNgSh64h4OhRy19qiDz12+AUre4a0l8OcOO8X\nXUkplUalrsYWdOXOUNdNTSY2s1x44lNzTkHKvqpFnj00mk7Fz/IaUJ3/Er9+F3w6\nJ3VQZH+/AgMBAAECggEAZPt2xmCztnbfknpDo6PZh6nqI3+9WFPhbJ+XtE530mG4\nhzmFwAEujjyLNZmqQL/OgRdFrXIzSRlZU7lG4647p+dUwwwFPVuqqIQvHB1tqar2\n4LrYOoh1zLpI23cC6c9z1DvjPupu8sXd+Vh/9lgJMs/mGRvN8BYgqCZea2kcmXXX\nBnosVErqXoaiDKq8iOke7YhPjE0Eu/mlku06MkCfvlXctuj/Alx875DeH82hNyU8\nbXKvSvRlAkEn3+m8ghmzABsYZgUVD/wD9xLMdkN9dSi1ntWwQAuZPeY7P1ZRp2gP\nkxZ/RSbezcmgqhsBqbqiI7STOHx+eo7yVHHhG5LtIQKBgQDtxzh9O4/kJ6ibn6t9\nIFUFx9tSxOXTOrsohIMi6VHWrwvdc43fet764CVM1NQwvp+DgrbjjTYc0h8KUJpx\nxdpa2NTkUcFJV3DCXnUqgK0BSASezDIFSgJJHpQEVumWdOBNltVPJ3mIqolCDosd\n8IyenXAknw8FQcb2kHZKAGtC1QKBgQDiJAfRfxS+h6tepiJoXqnhL414G0WNMLBe\ndABBp3fFJDDIQxCWDC93jJ8zbB1HcQsVjwMC3H2dKODFY72PHSB73buHC3d0vC1Q\nahKRcKaXY8ocTxOplAm16t481g7cGfa4ph28Colhhv5ftHFwbdBoh1HXfEqmc3R1\npTznu9b6QwKBgAG0ig0r3i5OsoDbNkmhb7qo4kPHsbZAF5OEz8PyVGnru3QNHhla\nMjsuXFYeuJ7Y3x/8Uf9zxc2THDHgvhrOxnAcWfqBM5epDt/1+XUikxsNPys8X6d2\nDmoj0//r96TilbE4wbLdn5uBTZaxsAG49ek1S9aXZW4uOJUQGCkTs7E5AoGAWEzl\nWKIcgYEMIzsPuF0uTCV7Qei0MbtPQrJc30X6+Fl3StsVAOHlLvMTvsp6bEjxoQtk\ni5t42QL7MVgOznD7HCKqdMK/dC9+KiYg9fVct0RZyM//x3lsiUIaYPrcdokU02jZ\nt3ENz60calZU7SeT9xzPkiqQI4p1cPKCY6HvAW0CgYEAy9C8SlQcjAs7/ftIUlTX\nm+cLRAdB1SF2Dq7A6gmvgi6mOxXYW3+y9YOuiwh/NPVkITOjaUD2yE+sxVWimx/8\nKKOifuzJIUVjNzx5kn/G5dUC2u4FtXzT0hTRTyp6Lx/rfIBkuuEmqhmPMwr295RY\nPXMa9LUkhOWTAD5teJbjkqQ=\n-----END PRIVATE KEY-----\n",
  "client_email": "terraform-script@fleet-garage-389620.iam.gserviceaccount.com",
  "client_id": "108398633453541488779",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/terraform-script%40fleet-garage-389620.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
EOT
}
