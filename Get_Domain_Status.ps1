Import-module activedirectory

$Domain = Read-Host -Prompt 'Enter domain: '

$pass = get-aduser $Domain -properties * | select  passwordlastset
$enable = get-aduser $Domain -properties * | select enabled
$expired = get-aduser $Domain -properties * | select  passwordexpired 
$locked = get-aduser $Domain -properties * | select  lockedout 

# This will check and see when the password was last reset
Write-Host $Domain "was last reset on" $pass

If ($enable = $True) {
Write-Host $Domain "is enabled"
}
Else {
Write-Host $Domain "is disabled"
}

If ($expired = $False) {
Write-Host $Domain "password has expired"
}
Else {
Write-Host $Domain "password is not expired"
}

If ($locked = $False) {
Write-Host $Domain "is locked"
}
Else {
Write-Host $Domain "is not locked"
}

Read-Host "Press any key to continue"

#KB0012295: How to check the password status of Domain Accounts
