#=======================================================
#NAME:exerciceAUDIT3services.ps1
#AUTHOR: RICHER Aymeric
#DATE:05/03/2025
#
#VERSION:1.0
#
#=======================================================




$logFile = "C:\git_cub\contextecubsituation10\auditDNS.txt"


if (!(Test-Path "C:\git_cub\contextecubsituation10")) {
    New-Item -ItemType Directory -Path "C:\git_cub\contextecubsituation10" -Name "auditDNS.txt" | Out-Null
}else {
    Remove-Item -Path $logFile -Force
}


$dateAudit = Get-Date -Format "yyyy-MM-dd HH:mm:ss"




$contenu = "Audit des enregistrements DNS - Lancé le $Date`n"
$dnsZones = Get-DnsServerZone
foreach ($zone in $dnsZones) {
    $dnsRecords = Get-DnsServerResourceRecord -ZoneName $zone.ZoneName -RRType A
    if ($dnsRecords.Count -gt 0) {
        $contenu += "Zone : $($zone.ZoneName)`n"
        
        foreach ($record in $dnsRecords) {
            $contenu += "  Nom : $($record.HostName), Adresse IP : $($record.RecordData.IPv4Address)`n"
            Write-Host "Zone : $($zone.ZoneName), Nom : $($record.HostName), Adresse IP : $($record.RecordData.IPv4Address)" -ForegroundColor green
        }
        $contenu += "`n"
    }
}
Set-Content -Path $logFile -Value $contenu
Write-Host "`nL'audit des enregistrements DNS a été enregistré dans $logFile"






