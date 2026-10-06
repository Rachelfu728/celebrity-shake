$ErrorActionPreference = 'SilentlyContinue'

$imagesDir = "C:\Users\user\.gemini\antigravity\scratch\celebrity_shake_showcase\images"

$targets = @{
    "olga.png" = "https://upload.wikimedia.org/wikipedia/commons/f/f3/Olga_Carmona_2020_01.png"
    "chicharito.jpg" = "https://upload.wikimedia.org/wikipedia/commons/4/4b/Chicharito_2010.jpg"
    "marykom.jpg" = "https://upload.wikimedia.org/wikipedia/commons/e/ec/Mary_Kom_with_Pranab.jpg"
    "lakshya.jpg" = "https://upload.wikimedia.org/wikipedia/commons/2/23/Lakshya_Sen_in_2018.jpg"
    "manika.jpg" = "https://upload.wikimedia.org/wikipedia/commons/f/fc/Manika_Batra_1.jpg"
    "arianna.jpg" = "https://upload.wikimedia.org/wikipedia/commons/4/4e/Arianna_Fontana_torino2006.jpg"
}

foreach ($item in $targets.GetEnumerator()) {
    $name = $item.Key
    $url = $item.Value
    $outPath = Join-Path $imagesDir $name
    Write-Host "Fetching $name from $url"
    curl.exe -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" -L $url -o $outPath
    if (Test-Path $outPath) {
        $bytes = (Get-Item $outPath).Length
        Write-Host "Done: $name ($bytes bytes)"
    }
}
