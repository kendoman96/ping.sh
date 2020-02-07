#!/bin/bash

main ()
        {

NUM=$(wc -l list.txt | awk -F 'list.txt' '{print $1}')
COUNT=0

        while [ $COUNT != $NUM ]; do
                COUNT=$(($COUNT+1))
                VAR=$(head -n $COUNT list.txt | tail -1)
                ping -c 100 -i .2 $VAR | sed '/^64/ d' | sed '/^PING/ d' | sed '/^$/ d' >> output.txt & PIDIOS=$!
        done

        echo "Running..."
        wait $PIDIOS
        echo "Done:"

        cat output.txt

        }

main;
