resource "aws_iam_policy" "omnistrate-bootstrap-permissions-boundary" {
  name = "omnistrate-bootstrap-permissions-boundary"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:DetachRolePolicy",
        "iam:DeleteRolePolicy",
        "iam:CreateRole",
        "iam:AttachRolePolicy",
        "iam:PutRolePolicy"
      ],
      "Condition": {
        "ForAnyValue:StringLike": {
          "iam:PermissionsBoundary": "arn:aws:iam::*:policy/omnistrate-bootstrap-permissions-boundary"
        }
      },
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "iam:UpdateAssumeRolePolicy",
        "iam:GetPolicyVersion",
        "iam:CreateServiceSpecificCredential",
        "iam:ListRoleTags",
        "iam:UpdateOpenIDConnectProviderThumbprint",
        "iam:RemoveRoleFromInstanceProfile",
        "iam:ListServiceSpecificCredentials",
        "iam:AddRoleToInstanceProfile",
        "iam:ListAttachedRolePolicies",
        "iam:ListOpenIDConnectProviderTags",
        "iam:ListRolePolicies",
        "iam:DeleteOpenIDConnectProvider",
        "iam:ListPolicies",
        "iam:UpdateServiceSpecificCredential",
        "iam:GetRole",
        "iam:GetPolicy",
        "iam:RemoveClientIDFromOpenIDConnectProvider",
        "iam:ListEntitiesForPolicy",
        "iam:DeleteRole",
	"iam:DeletePolicy",
        "iam:UpdateRoleDescription",
        "iam:GetUserPolicy",
        "iam:ListGroupsForUser",
        "ec2:*",
        "iam:DeleteServiceLinkedRole",
        "iam:GetGroupPolicy",
        "iam:GetOpenIDConnectProvider",
        "eks:*",
        "iam:GetRolePolicy",
        "iam:CreateInstanceProfile",
        "iam:UntagRole",
        "iam:TagRole",
	"iam:TagPolicy",
        "iam:ListPoliciesGrantingServiceAccess",
        "iam:ResetServiceSpecificCredential",
        "iam:ListInstanceProfileTags",
        "iam:GetServiceLinkedRoleDeletionStatus",
        "iam:PassRole",
        "iam:ListPolicyTags",
        "iam:CreatePolicyVersion",
        "iam:DeleteInstanceProfile",
        "iam:GetInstanceProfile",
        "iam:ListRoles",
        "elasticloadbalancing:*",
        "iam:ListUserPolicies",
        "iam:ListInstanceProfiles",
        "iam:CreateOpenIDConnectProvider",
        "iam:CreatePolicy",
        "iam:CreateServiceLinkedRole",
        "iam:ListPolicyVersions",
        "iam:ListOpenIDConnectProviders",
        "iam:UntagPolicy",
        "iam:UpdateRole",
        "iam:UntagOpenIDConnectProvider",
        "iam:AddClientIDToOpenIDConnectProvider",
        "iam:UntagInstanceProfile",
        "iam:DeleteServiceSpecificCredential",
        "iam:TagOpenIDConnectProvider",
        "iam:DeletePolicyVersion",
        "iam:TagInstanceProfile",
        "iam:SetDefaultPolicyVersion",
        "route53:*",
        "s3:*",
        "kms:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "S3Access",
      "Effect": "Allow",
      "Action": [
          "s3:*"
      ],
      "Resource": [
          "arn:aws:s3:::omnistrate-${data.aws_caller_identity.current.account_id}-dp-pulumi",
          "arn:aws:s3:::omnistrate-${data.aws_caller_identity.current.account_id}-dp-pulumi/*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "omnistrate-bootstrap-policy" {
  name = "omnistrate-bootstrap-policy"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:DetachRolePolicy",
        "iam:DeleteRolePolicy",
        "iam:CreateRole",
        "iam:AttachRolePolicy",
        "iam:PutRolePolicy"
      ],
      "Condition": {
        "ForAnyValue:StringLike": {
          "iam:PermissionsBoundary": "arn:aws:iam::*:policy/omnistrate-bootstrap-permissions-boundary"
        }
      },
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "iam:UpdateAssumeRolePolicy",
        "iam:GetPolicyVersion",
        "iam:CreateServiceSpecificCredential",
        "iam:ListRoleTags",
        "iam:UpdateOpenIDConnectProviderThumbprint",
        "iam:RemoveRoleFromInstanceProfile",
        "iam:ListServiceSpecificCredentials",
        "iam:AddRoleToInstanceProfile",
        "iam:ListAttachedRolePolicies",
        "iam:ListOpenIDConnectProviderTags",
        "iam:ListRolePolicies",
        "iam:DeleteOpenIDConnectProvider",
        "iam:ListPolicies",
        "iam:UpdateServiceSpecificCredential",
        "iam:GetRole",
        "iam:GetPolicy",
        "iam:RemoveClientIDFromOpenIDConnectProvider",
        "iam:ListEntitiesForPolicy",
        "iam:DeleteRole",
        "iam:UpdateRoleDescription",
        "iam:GetUserPolicy",
        "iam:ListGroupsForUser",
        "ec2:*",
        "iam:DeleteServiceLinkedRole",
        "iam:GetGroupPolicy",
        "eks:*",
        "iam:GetOpenIDConnectProvider",
        "iam:GetRolePolicy",
        "iam:CreateInstanceProfile",
        "iam:UntagRole",
        "iam:TagRole",
        "iam:ListPoliciesGrantingServiceAccess",
        "iam:ResetServiceSpecificCredential",
        "iam:ListInstanceProfileTags",
        "iam:GetServiceLinkedRoleDeletionStatus",
        "iam:ListInstanceProfilesForRole",
        "iam:PassRole",
        "iam:ListPolicyTags",
        "iam:CreatePolicyVersion",
        "iam:DeleteInstanceProfile",
        "iam:GetInstanceProfile",
        "iam:ListRoles",
        "elasticloadbalancing:*",
        "iam:ListUserPolicies",
        "iam:ListInstanceProfiles",
        "iam:CreateOpenIDConnectProvider",
        "iam:CreatePolicy",
        "iam:CreateServiceLinkedRole",
        "iam:ListPolicyVersions",
        "iam:ListOpenIDConnectProviders",
        "iam:UntagPolicy",
        "iam:UpdateRole",
        "iam:UntagOpenIDConnectProvider",
        "iam:AddClientIDToOpenIDConnectProvider",
        "iam:UntagInstanceProfile",
        "iam:DeleteServiceSpecificCredential",
        "iam:TagOpenIDConnectProvider",
        "iam:DeletePolicyVersion",
        "iam:TagInstanceProfile",
        "iam:SetDefaultPolicyVersion"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": "autoscaling:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "S3Access",
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
          "arn:aws:s3:::omnistrate-${data.aws_caller_identity.current.account_id}-dp-pulumi",
          "arn:aws:s3:::omnistrate-${data.aws_caller_identity.current.account_id}-dp-pulumi/*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "omnistrate-infrastructure-provisioning-policy" {
  name = "omnistrate-infrastructure-provisioning-policy"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
	{
	    "Action": [
		"iam:Get*",
		"iam:List*"
	    ],
	    "Effect": "Allow",
	    "Resource": "*"
	},
	{
	    "Action": [
		"iam:GetRole",
		"iam:PassRole",
		"iam:ListAttachedRolePolicies"
	    ],
	    "Effect": "Allow",
	    "Resource": [
	        "arn:aws:iam::*:role/ows-ec2-node-group-role",
	        "arn:aws:iam::*:role/omnistrate-eks-iam-role",
	        "arn:aws:iam::*:role/omnistrate-ec2-node-group-iam-role",
	        "arn:aws:iam::*:role/aws-service-role/eks-nodegroup.amazonaws.com/AWSServiceRoleForAmazonEKSNodegroup"
	    ]
    	},
        {
            "Action": [
                "iam:*"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:iam::*:role/omnistrate/*", 
                "arn:aws:iam::*:policy/omnistrate/*"
            ]
        },
	{
	      "Action": [
	        "s3:*",
	        "ec2:*",
	        "elasticloadbalancing:*",
	        "eks:*"
	      ],
	      "Effect": "Allow",
	      "Resource": "*"
	}
  ],
  "Version": "2012-10-17"
}
POLICY
}
