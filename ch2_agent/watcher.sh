#!/bin/sh
while true
do
        # Change: Use hostname 'insideweb' and port '80' directly
        if `printf "GET / HTTP/1.0\n\n" | nc -w 2 insideweb 80 | grep -q '200 OK'`
        then
                echo "System up."
        else
                # Change: Use hostname 'insidemailer' and port '33333' directly
                printf "To: admin@work  Message: The service is down!" | nc insidemailer 33333
                break
        fi

        sleep 1
done
