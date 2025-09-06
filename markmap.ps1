# Define the path to start the search from, '.' means the current directory
$startPath = '.'

# Find all .mm.md files recursively
Get-ChildItem -Path $startPath -Filter *.mm.md -Recurse | ForEach-Object {
    # Construct the output file name by replacing '.mm.md' with '.html'
    $outputFile = $_.FullName -replace '\.mm\.md$', '.mm.html'
    
    # Use markmap to convert the Markdown file to an HTML file
    # Note: Adjust the markmap command as necessary for your needs
    markmap $_.FullName --output $outputFile
    
    Write-Host "Converted $($_.FullName) to $outputFile"
}