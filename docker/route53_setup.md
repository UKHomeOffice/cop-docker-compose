# Route 53 and IAM settings for AWS to enable DNS validation of LetsEncrypt certs

Register a new DNS name with a DNS provider, then go to route53 and add it as a new zone.

For this example we will use the domain name lodev.xyz, setup the following DNS records:

### Record 1
Type = A
Name = lodev.xyz
Value = 10.254.254.254
TTL = 300

### Record 2
Type = A
Name = *.lodev.xyz
Value = 10.254.254.254
TTL = 300

Now go to your DNS registar and update the Name Server details changing the names and values to the ones given for your zone in route53 under the NS record.

## IAM Settings

Create the following policy in IAM
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "iam:GetServerCertificate",
                "elasticloadbalancing:DescribeLoadBalancers",
                "route53:GetChange",
                "iam:ListServerCertificates",
                "route53:ListHostedZones",
                "route53:ChangeResourceRecordSets",
                "route53:ListResourceRecordSets",
                "elasticloadbalancing:SetLoadBalancerListenerSSLCertificate",
                "iam:UploadServerCertificate"
            ],
            "Resource": "*"
        }
    ]
}
```

Create a new IAM user for managing DNS and attach just the policy above. Then create API service credential for it.
