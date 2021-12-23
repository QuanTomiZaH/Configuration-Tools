# Variables used per certbot documentation for Pre and Post Validation Hooks:
# CERTBOT_DOMAIN: The domain being authenticated
# CERTBOT_VALIDATION: The validation string
#

$splitdomain = $env:CERTBOT_DOMAIN.Split(".")
$zone = $splitdomain[-2..-1] -join '.'
$subname = $splitdomain[0..($splitdomain.length - 3)] -join'.'
#
#if ( $subname" -eq $zone ){
#    # No subname
#    $txtname="_acme-challenge"
#}else {
#    $txtname="_acme-challenge.$subname"
#}
$txtname="_acme-challenge.$subname"

echo $txtname

az network dns record-set txt delete --resource-group <name> --zone-name $zone --name $txtname -y
az network dns record-set txt add-record --resource-group <name> --zone-name $zone --record-set-name $txtname --value $env:CERTBOT_VALIDATION

# Give time for DNS to propagate.
Start-Sleep -Seconds 60