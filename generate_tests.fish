for i in (seq 100)
    set -l entrada (python generate_tests.py)
    set -l saida (echo "$entrada" | ./ep1 | grep -oE "[[:digit:]]+")

    echo teste $i \""$entrada"\" \""$saida"\"
end
