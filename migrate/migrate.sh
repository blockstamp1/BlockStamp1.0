cat export.csv | while read a; do curl -G localhost:3004/api/internal/migrate --data-urlencode "d=$a"; done
