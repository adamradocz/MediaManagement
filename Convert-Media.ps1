param ($path = ".\")

$files = Get-ChildItem -Path "$path" -Filter *.m4a -Recurse
foreach ($input in $files)
{
    $output = [io.path]::ChangeExtension($input, "flac")  
    ffmpeg -i "$input" -map_metadata 0 -c copy "$output"
    Remove-Item -Path $input
}