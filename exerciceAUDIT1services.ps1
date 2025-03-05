#=======================================================
#NAME:exerciceAUDIT1services.ps1
#AUTHOR: RICHER Aymeric
#DATE:26/02/2025
#
#VERSION:1.0
#
#=======================================================


    
$logPath = "C:\git_cub\contextecubsituation10\auditServices.txt"


if (!(Test-Path "C:\git_cub\contextecubsituation10")) {
    New-Item -ItemType Directory -Path "C:\git_cub\contextecubsituation10" -Name "auditServices.txt" | Out-Null
}else {
    Remove-Item -Path $logPath -Force
}


$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"


$services = @(
    "DHCPServer",   
    "DNS",          
    "ADWS"         
)

try {
    $logContent = @()
    $logContent += "Rapport de l'état des services - $date"
    $logContent += "--------------------------------------------"


    foreach ($service in $services) {
        $status = Get-Service -Name $service -ErrorAction SilentlyContinue
        if ($status) {
            $logContent += "$($status.DisplayName) : $($status.Status)"
        } else {
            $logContent += "$service : Service non trouvé"
        }
    }
    $logContent | Out-File -FilePath $logPath -Encoding UTF8 -Append
}
catch{"échec de la création du fichier";break}








