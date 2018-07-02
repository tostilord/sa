rule get_ids:
    input:
        "data/RNA5.txt"
    output:
        "data/ids.txt"
    shell:
        "python3 scripts/get_ids.py {input} > {output}"

rule get_string_query_ids:
    input:
        "data/ids.txt"
    output:
        "data/string_query_ids.txt"
    shell:
        "python3 scripts/get_string_ids.py {input} > {output}"

rule get_string_ids:
    input:
        "data/string_query_ids.txt"
    output:
        "data/string_ids.tsv"
    shell:
        "curl -o {output} $(cat {input})"

rule get_string_query_interaction_partners:
    input:
        "data/string_ids.tsv"
    output:
        "data/string_query_interaction_partners.txt"
    shell:
        "python3 scripts/get_interaction_partners.py {input} > {output}"

rule get_string_interaction_partners:
    input:
        "data/string_query_interaction_partners.txt"
    output:
        "data/string_interaction_partners.tsv"
    shell:
        "curl -o {output} $(cat {input})"
