$ErrorActionPreference = 'SilentlyContinue'

$imagesDir = "C:\Users\user\.gemini\antigravity\scratch\celebrity_shake_showcase\images"
if (!(Test-Path $imagesDir)) {
    New-Item -ItemType Directory -Path $imagesDir -Force | Out-Null
}

$targets = @{
    "cr7.jpg" = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Cristiano_Ronaldo_2018.jpg/640px-Cristiano_Ronaldo_2018.jpg"
    "messi.jpg" = "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg/640px-Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg"
    "kohli.jpg" = "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Virat_Kohli_during_the_India_vs_Australia_4th_Test_match_at_Narendra_Modi_Stadium.jpg/640px-Virat_Kohli_during_the_India_vs_Australia_4th_Test_match_at_Narendra_Modi_Stadium.jpg"
    "kim.jpg" = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Kim_Yeon-koung_in_2020.jpg/640px-Kim_Yeon-koung_in_2020.jpg"
}

foreach ($name in $targets.Keys) {
    $url = $targets[$name]
    $outPath = Join-Path $imagesDir $name
    Write-Host "Downloading $name from $url"
    try {
        $wc = New-Object System.Net.WebClient
        $wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
        $wc.DownloadFile($url, $outPath)
        if (Test-Path $outPath) {
            $bytes = (Get-Item $outPath).Length
            Write-Host "Success $name ($bytes bytes)"
        }
    } catch {
        Write-Host "Failed ${name} - $($_.Exception.Message)"
    }
}
