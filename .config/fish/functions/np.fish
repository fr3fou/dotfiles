function np --description 'Upload a file to cdn.simo.sh'
    if [ $argv[1] ]
        # write to output to tmpfile because of progress bar
        set -l tmpfile ( mktemp -t transferXXXXXX )
        set -l name ( basename $argv[1] )
        if [ $argv[1] = '-' ]
            set name ( openssl rand -hex 4 )
        end
        curl --progress-bar --upload-file "$argv[1]" https://cdn.simo.sh/$name >> $tmpfile
        cat $tmpfile | pbcopy; cat $tmpfile
        command rm -f $tmpfile
    else
        echo 'usage: t FILE_TO_TRANSFER'
    end
end
