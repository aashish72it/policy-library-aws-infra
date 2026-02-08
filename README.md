# policy-library-aws-infra

Sentinel policy library to govern AWS infra created by Terraform. Includes S3 controls (encryption, public access block, versioning), EC2 instance-type allowlist, and required tags.

## Modules
- `s3_utils` - s3 module for sentinel policies.
- `ec2_utils` - ec2 module for sentinel policies.


# Project Structure

<pre>

policy-library-aws-infra/
├── README.md
├── sentinel.hcl
├── modules/
│   ├── common.sentinel
│   ├── s3_utils.sentinel
│   └── ec2_utils.sentinel
└── LICENSE

</pre>