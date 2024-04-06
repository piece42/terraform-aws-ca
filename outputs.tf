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

output "ddb_table_arn" {
  value       = module.dynamodb.ddb_table_arn
  description = "ARN of the DynamoDB table used for storing CA information"
}

output "kms_arn_issuing_ca" {
  value       = module.kms_rsa_issuing_ca.kms_arn
  description = "Information about the Issuing CA"
}

output "kms_arn_root_ca" {
  value       = module.kms_rsa_root_ca.kms_arn
  description = "Information about the Root CA"
}

output "kms_arn_tls_keygen" {
  value       = module.kms_tls_keygen.kms_arn
  description = "Information about the TLS Keygen"
}

output "kms_arn_resource" {
  value       = var.kms_arn_resource
  description = "Information about the Resource"
  
}
