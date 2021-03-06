#$files = Get-ChildItem "C:\Users\gerhardl\Documents\My Received Files\"
$files = Get-ChildItem "./"
#$files = Get-ChildItem "./" -Filter *.log
foreach ($f in $files){
    #$outfile = $f.FullName + "out" 
    #Get-Content $f.FullName | Where-Object { ($_ -match 'step4' -or $_ -match 'step9') } | Set-Content $outfile

    #$in = "C:\Users\abc\Desktop\File\abc.txt"
    #$out = "C:\Users\abc\Desktop\File\abc-out.txt"
    #$outfile =  "file : " + $f.FullName
    $outfile = $f.FullName + "out" 
    $print = "file : " + $f.FullName 
    echo $print
    (Get-Content $f.FullName) -join "`n" > $outfile

    #Copy-Item C:\Path\To\File\file.ext "C:\Path\To\New\File\$newfilename"
    

    Get-Item $outfile | ForEach-Object {
        Remove-Item -Path $f.FullName
        Rename-Item $_ ($_.Name -replace "out", "")
    }
    #Copy-Item C:\TEST\file1.jpg C:\TEST\file2.jpg
}
