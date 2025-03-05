#=======================================================
#NAME:exerciceAUDIT3services.ps1
#AUTHOR: RICHER Aymeric
#DATE:05/03/2025
#
#VERSION:1.0
#
#=======================================================


$logFile = "C:\git_cub\contextecubsituation10\auditAD.txt"


if (!(Test-Path "C:\git_cub\contextecubsituation10")) {
    New-Item -ItemType Directory -Path "C:\git_cub\contextecubsituation10" -Name "auditAD.txt" | Out-Null
}else {
    Remove-Item -Path $logFile -Force
}


$dateAudit = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$contenu = "Audit des enregistrements DNS - Lancé le $Date`n"


Get-LocalUser | Format-List * | Out-File -FilePath $logFile -Append -Encoding utf8




