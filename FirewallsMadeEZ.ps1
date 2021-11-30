write-host "----------------------QUICK-N-EZ FIREWALL RULE CREATOR----------------------"
write-host "Enter Rule name:"
$input = read-host
$ruleName = $input

write-host "Direction? Inbound(I), Outbound(O), Both(B)"
$input = read-host
$direction = $input

write-host "Port Number?"
$input = read-host
$port = $input

write-host "TCP(T) or UDP (U)?"
$input = read-host
$proto = $input

write-host "Block(B) or Allow(A)?"
$input = read-host
$action = $input

if($direction -eq "I" -and $proto -eq "T" -and $action -eq "B"){
    $ruleName=$ruleName + "Inbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -LocalPort $port -Protocol TCP -Action Block
}
elseif($direction -eq "O" -and $proto -eq "T" -and $action -eq "B"){
    $ruleName=$ruleName + "Outbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Outbound -LocalPort $port -Protocol TCP -Action Block
}
elseif($direction -eq "B" -and $proto -eq "T" -and $action -eq "B"){
    $ruleName=$ruleName + "Inbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -LocalPort $port -Protocol TCP -Action Block
    $ruleName=$ruleName + "Outbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Outbound -LocalPort $port -Protocol TCP -Action Block
}
elseif($direction -eq "I" -and $proto -eq "T" -and $action -eq "A"){
    $ruleName=$ruleName + "Inbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -LocalPort $port -Protocol TCP -Action Allow
}
elseif($direction -eq "O" -and $proto -eq "T" -and $action -eq "A"){
    $ruleName=$ruleName + "Outbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Outbound -LocalPort $port -Protocol TCP -Action Allow
}
elseif($direction -eq "B" -and $proto -eq "TCP" -and $action -eq "A"){
    $ruleName=$ruleName + "Inbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -LocalPort $port -Protocol TCP -Action Allow
    $ruleName=$ruleName + "Outbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Outbound -LocalPort $port -Protocol TCP -Action Allow
}
elseif($direction -eq "I" -and $proto -eq "U" -and $action -eq "A"){
    $ruleName=$ruleName + "Inbound"   
    New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -LocalPort $port -Protocol UDP -Action Allow
}
elseif($direction -eq "O" -and $proto -eq "U" -and $action -eq "A"){
    $ruleName=$ruleName + "Outbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Outbound -LocalPort $port -Protocol UDP -Action Allow
}
elseif($direction -eq "B" -and $proto -eq "U" -and $action -eq "A"){
    $ruleName=$ruleName + "Inbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -LocalPort $port -Protocol UDP -Action Allow
    $ruleName=$ruleName + "Outbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Outbound -LocalPort $port -Protocol UDP -Action Allow
}
elseif($direction -eq "I" -and $proto -eq "U" -and $action -eq "B"){
    $ruleName=$ruleName + "Inbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -LocalPort $port -Protocol UDP -Action Block
}
elseif($direction -eq "O" -and $proto -eq "U" -and $action -eq "B"){
    $ruleName=$ruleName + "Inbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -LocalPort $port -Protocol UDP -Action Block
}
elseif($direction -eq "B" -and $proto -eq "U" -and $action -eq "B"){
    $ruleName=$ruleName + "Inbound"
    New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -LocalPort $port -Protocol UDP -Action Block
}
