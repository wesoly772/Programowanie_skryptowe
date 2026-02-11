param(
    $file
)

#File hash
$hash = Get-FileHash -Algorithm SHA256 -Path $file | Select-Object -ExpandProperty Hash

#Headers
$headers=@{}
$headers.Add("accept", "application/json")
$headers.Add("x-apikey", "f5269e38dd5a80f21f792c7ff31afd13fcc58aceba453f260abe388bd380850f")

#Query VirusTotal
$response = Invoke-WebRequest -Uri "https://www.virustotal.com/api/v3/files/$hash"  -Method GET -Headers $headers | ConvertFrom-Json

#Results
$stat = $response.data.attributes.last_analysis_stats.malicious
if ($stat -gt 0){
    Write-Host "Plik is possibly malicious!"
}else{
    Write-Host "Plik is probably safe!"
}



