#=======================================================
#NAME:exerciceAUDIT2services.ps1
#AUTHOR: RICHER Aymeric
#DATE:05/03/2025
#
#VERSION:1.0
#
#=======================================================


$logFile = "C:\git_cub\contextecubsituation10\auditDHCP.txt"


if (!(Test-Path "C:\git_cub\contextecubsituation10")) {
    New-Item -ItemType Directory -Path "C:\git_cub\contextecubsituation10" -Name "auditDHCP.txt" | Out-Null
}else {
    Remove-Item -Path $logFile -Force
}


$dateAudit = Get-Date -Format "yyyy-MM-dd HH:mm:ss"


"Audit DHCP - Date : $dateAudit`n" | Out-File -FilePath $logFile -Encoding utf8


$scopes = Get-DhcpServerv4Scope


foreach ($scope in $scopes) {
    $scopeName = $scope.Name
    $status = if ($scope.State -eq "Active") { "Activée" } else { "Désactivée" }
    
    
    "$scopeName`t$status" | Out-File -FilePath $logFile -Append -Encoding utf8
    
    
    if ($scope.State -eq "Active") {
        Write-Host "$scopeName`t$status" -ForegroundColor Green
    } else {
        Write-Host "$scopeName`t$status" -ForegroundColor Red
    }
}

Write-Host "Audit terminé. Résultats enregistrés dans : $logFile" -ForegroundColor Cyan
























