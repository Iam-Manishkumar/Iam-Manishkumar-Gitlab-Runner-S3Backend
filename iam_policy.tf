data "aws_iam_policy_document" "ssm_iam_policy" {
  statement {
    effect = "Allow"
    actions = [
      "ssm:DescribeAssociation",
      "ssm:GetDeployablePatchSnapshotForInstance",
      "ssm:GetDocument",
      "ssm:DescribeDocument",
      "ssm:GetManifest",
      "ssm:GetParameters",
      "ssm:ListAssociations",
      "ssm:ListInstanceAssociations",
      "ssm:PutInventory",
      "ssm:PutComplianceItems",
      "ssm:PutConfigurePackageResult",
      "ssm:UpdateAssociationStatus",
      "ssm:UpdateInstanceAssociationStatus",
      "ssm:UpdateInstanceInformation"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2messages:AcknowledgeMessage",
      "ec2messages:DeleteMessage",
      "ec2messages:FailMessage",
      "ec2messages:GetEndpoint",
      "ec2messages:GetMessages",
      "ec2messages:SendReply"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "cloudwatch:PutMetricData"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeInstanceStatus"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "ds:CreateComputer",
      "ds:DescribeDirectories"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetBucketLocation",
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetEncryptionConfiguration",
      "s3:AbortMultipartUpload",
      "s3:ListMultipartUploadParts",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "runner_iam_policy" {
  statement {
    sid    = "VisualEditor0"
    effect = "Allow"
    actions = [
      "logs:PutRetentionPolicy",
      "logs:PutMetricFilter",
      "logs:ListTagsLogGroup",
      "logs:ListTagsForResource",
      "logs:DescribeMetricFilters",
      "logs:DeleteMetricFilter",
      "logs:DeleteLogGroup",
      "iam:UpdateAssumeRolePolicy",
      "iam:UntagRole",
      "iam:UntagInstanceProfile",
      "iam:TagRole",
      "iam:TagOpenIDConnectProvider",
      "iam:TagInstanceProfile",
      "iam:RemoveRoleFromInstanceProfile",
      "iam:PutRolePolicy",
      "iam:PassRole",
      "iam:ListRoles",
      "iam:ListRoleTags",
      "iam:ListRolePolicies",
      "iam:ListPolicyVersions",
      "iam:ListPolicyTags",
      "iam:ListPolicies",
      "iam:ListOpenIDConnectProviders",
      "iam:ListInstanceProfilesForRole",
      "iam:ListAttachedRolePolicies",
      "iam:GetRolePolicy",
      "iam:GetRole",
      "iam:GetPolicyVersion",
      "iam:GetPolicy",
      "iam:GetOpenIDConnectProvider",
      "iam:GetInstanceProfile",
      "iam:DetachRolePolicy",
      "iam:DeleteRolePolicy",
      "iam:DeleteRole",
      "iam:DeletePolicyVersion",
      "iam:DeletePolicy",
      "iam:DeleteOpenIDConnectProvider",
      "iam:DeleteInstanceProfile",
      "iam:CreateRole",
      "iam:CreatePolicyVersion",
      "iam:CreatePolicy",
      "iam:CreateOpenIDConnectProvider",
      "iam:CreateInstanceProfile",
      "iam:AttachRolePolicy",
      "iam:AddRoleToInstanceProfile",
      "eks:RegisterCluster",
      "eks:ListClusters",
      "eks:DescribeAddonVersions",
      "eks:CreateCluster",
      "ec2:UpdateSecurityGroupRuleDescriptionsIngress",
      "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
      "ec2:TerminateInstances",
      "ec2:RunInstances",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:ResetNetworkInterfaceAttribute",
      "ec2:ModifySecurityGroupRules",
      "ec2:ModifyNetworkInterfaceAttribute",
      "ec2:ModifyLaunchTemplate",
      "ec2:ModifyInstanceAttribute",
      "ec2:GetLaunchTemplateData",
      "ec2:DetachNetworkInterface",
      "ec2:DescribeVpcs",
      "ec2:DescribeVolumes",
      "ec2:DescribeTags",
      "ec2:DescribeSubnets",
      "ec2:DescribeStaleSecurityGroups",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSecurityGroupRules",
      "ec2:DescribeSecurityGroupReferences",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeNetworkInterfacePermissions",
      "ec2:DescribeNetworkInterfaceAttribute",
      "ec2:DescribeLaunchTemplates",
      "ec2:DescribeLaunchTemplateVersions",
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceTypes",
      "ec2:DescribeInstanceCreditSpecifications",
      "ec2:DescribeInstanceAttribute",
      "ec2:DescribeImages",
      "ec2:DescribeAccountAttributes",
      "ec2:DeleteTags",
      "ec2:DeleteSecurityGroup",
      "ec2:DeleteNetworkInterfacePermission",
      "ec2:DeleteNetworkInterface",
      "ec2:DeleteLaunchTemplateVersions",
      "ec2:DeleteLaunchTemplate",
      "ec2:CreateTags",
      "ec2:CreateSecurityGroup",
      "ec2:CreateNetworkInterfacePermission",
      "ec2:CreateNetworkInterface",
      "ec2:CreateLaunchTemplateVersion",
      "ec2:CreateLaunchTemplate",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:AttachNetworkInterface",
      "ec2:ApplySecurityGroupsToClientVpnTargetNetwork",
      "autoscaling:UpdateAutoScalingGroup",
      "autoscaling:SetInstanceProtection",
      "autoscaling:DescribeTags",
      "autoscaling:DescribeScalingActivities",
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DeleteTags",
      "autoscaling:DeleteAutoScalingGroup",
      "autoscaling:CreateOrUpdateTags",
      "autoscaling:CreateAutoScalingGroup",
      "eks:DescribeCluster",
      "eks:DescribeNodegroup",
      "eks:CreateNodegroup",
      "eks:DeleteCluster",
      "eks:DeleteNodegroup",
      "eks:DeregisterCluster",
      "eks:AccessKubernetesApi",
      "eks:CreateAccessEntry",
      "eks:CreateAddon",
      "eks:CreatePodIdentityAssociation",
      "eks:DeleteAccessEntry",
      "eks:DeleteAddon",
      "eks:DeletePodIdentityAssociation",
      "eks:DisassociateAccessPolicy",
      "eks:DisassociateIdentityProviderConfig",
      "eks:UpdateClusterVersion",
      "eks:UpdateClusterConfig",
      "eks:UpdateNodegroupConfig",
      "eks:UpdateNodegroupVersion",
      "eks:UpdatePodIdentityAssociation"
    ]

    resources = ["*"]
  }
  statement {
    sid     = "VisualEditor1"
    effect  = "Allow"
    actions = ["eks:*"]
    resources = [
      "arn:aws:eks:*:485410634341:addon/*/*/*",
      "arn:aws:eks:*:485410634341:nodegroup/*/*/*",
      "arn:aws:eks:*:485410634341:cluster/*",
      "arn:aws:eks:*:485410634341:fargateprofile/*/*/*",
      "arn:aws:eks:*:485410634341:identityproviderconfig/*/*/*/*"
    ]
  }

}



