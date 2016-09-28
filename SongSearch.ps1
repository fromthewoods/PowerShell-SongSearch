$search = Read-Host -Prompt "Enter name of artist or track"
$files = Get-Item -Path 'C:\Downloads\*.json'

Foreach ($file in $files) {
    $json = ConvertFrom-Json (Get-Content $file) 

    Foreach ($track in $json.data) {
        If ($track.title -match $search) {
            Write-Host "$($json.meta.name) : $($track.title)"
        }
    }
}