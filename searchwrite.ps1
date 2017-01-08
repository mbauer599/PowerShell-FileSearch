function searchwrite {

for ( $i = 0; $i -lt $args.count; $i++ ) {
    if ($args[ $i ] -eq "/h"){ $helpset=$TRUE }
    if ($args[ $i ] -eq "-h"){ $helpset=$TRUE }
    if ($args[ $i ] -eq "/d"){ $strDir=$args[ $i+1 ] }
    if ($args[ $i ] -eq "-d"){ $strDir=$args[ $i+1 ] }
    if ($args[ $i ] -eq "/f"){ $strExt=$args[ $i+1 ] }
    if ($args[ $i ] -eq "-f"){ $strExt=$args[ $i+1 ] }
}

if( $helpset ){
    '
    This is a simple function to search for all writable files of a specified type recersivly from a specified
    directory. It will search from start dir and test whether or not user can write to each file.


    Usage:
        
        /f -f : File Type 
            (ex: .exe or .txt)
        /d -d : Directory

        /h -h : Help ( This Entry )
    
    '
    
}
else{

    foreach ($file in (gci $strDir -Recurse 2> out-null)){
    
       if( $file.fullname -match $strExt){
          try {
            [io.file]::OpenWrite($file).close() 2> out-null
          }
          Catch { 
            Write-Warning "Failed: $($file.fullname)"
          }

          if ($?){
           "writable: $($file.fullname)"
          }

         }}}
}