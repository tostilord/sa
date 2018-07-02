rule get_ids:
    input:
        "data/RNA5.txt"
    output:
        "data/ids.txt"
    shell:
        "python3 scripts/get_ids.py {input} > {output}"

rule get_string_query:
    input:
        "data/ids.txt"
    output:
        "data/string_query.txt"
    shell:
        "python3 scripts/get_string_ids.py {input} > {output}"

rule get_string_data:
    input:
        "data/string_query.txt"
    output:
        "data/string_data.tsv"
    shell:
        "curl -o {output} $(cat {input})"
