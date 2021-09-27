function transfer --description 'Upload a file to transfer.sh'
    if [ $argv[1] ]
        # write to output to tmpfile because of progress bar
        set -l tmpfile ( mktemp -t transferXXXXXX )
        curl --progress-bar --upload-file "$argv[1]" https://cdn.simo.sh/(basename $argv[1]) >> $tmpfile
        cat $tmpfile
        command rm -f $tmpfile
    else
        echo 'usage: transfer FILE_TO_TRANSFER'
    end
end
