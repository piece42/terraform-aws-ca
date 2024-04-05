output "cloudfront_domain_name" {
  value       = var.public_crl ? module.ca_cloudfront[0].cloudfront_domain_name : null
  description = "Domain name of CloudFront distribution used for public CRL"
}

output "ca_bundle_s3_location" {
  value       = contains(var.prod_envs, var.env) ? "${module.external_s3.s3_bucket_domain_name}/${var.project}-ca-bundle.pem" : "${module.external_s3.s3_bucket_domain_name}/${var.project}-ca-bundle-${var.env}.pem"
  description = "S3 location of CA bundle for use as a TrustStore"
}

output "issuing_ca_cert_s3_location" {
  value       = contains(var.prod_envs, var.env) ? "${module.external_s3.s3_bucket_domain_name}/${var.project}-issuing-ca.crt" : "${module.external_s3.s3_bucket_domain_name}/${var.project}-issuing-ca-${var.env}.crt"
  description = "S3 location of Issuing CA certificate file"
}

output "issuing_ca_crl_s3_location" {
  value       = contains(var.prod_envs, var.env) ? "${module.external_s3.s3_bucket_domain_name}/${var.project}-issuing-ca.crl" : "${module.external_s3.s3_bucket_domain_name}/${var.project}-issuing-ca-${var.env}.crl"
  description = "S3 location of Issuing CA CRL file"
}

output "root_ca_cert_s3_location" {
  value       = contains(var.prod_envs, var.env) ? "${module.external_s3.s3_bucket_domain_name}/${var.project}-root-ca.crt" : "${module.external_s3.s3_bucket_domain_name}/${var.project}-root-ca-${var.env}.crt"
  description = "S3 location of Root CA certificate file"
}

output "root_ca_crl_s3_location" {
  value       = contains(var.prod_envs, var.env) ? "${module.external_s3.s3_bucket_domain_name}/${var.project}-root-ca.crl" : "${module.external_s3.s3_bucket_domain_name}/${var.project}-root-ca-${var.env}.crl"
  description = "S3 location of Root CA CRL file"
}

#
# Piece 42 Additions
#
output "external_bucket_name" {
  value       = module.external_s3.s3_bucket_name
  description = "Name of the S3 bucket used for external storage"
}

output "internal_bucket_name" {
  value       = module.internal_s3.s3_bucket_name
  description = "Name of the S3 bucket used for internal storage"
}
