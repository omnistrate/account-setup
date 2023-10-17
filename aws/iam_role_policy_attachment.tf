resource "aws_iam_role_policy_attachment" "omnistrate-bootstrap-role_omnistrate-bootstrap-policy" {
  policy_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/omnistrate-bootstrap-policy"
  role       = "omnistrate-bootstrap-role"
  depends_on = [
    aws_iam_policy.omnistrate-bootstrap-policy,
    aws_iam_policy.omnistrate-bootstrap-permissions-boundary
  ]
}