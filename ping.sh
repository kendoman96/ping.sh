#!/bin/bash
cat list.txt | while read output

do
    ping -c 100 -i .2 "$output" | sed '/^64/ d'>> output.txt
        echo "=================================" >> output.txt
    if [ $? -eq 0 ]; then
            echo "node $output is up"
    else
            echo "node $output is down"
    fi

done
