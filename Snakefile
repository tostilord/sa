rule all:
    input:
        "data/report.html"

rule get_ids:
    input:
        "input/RNA5.txt"
    output:
        "data/ids.txt"
    shell:
        "python3 scripts/get_ids.py {input} > {output}"

rule get_string_ids_query:
    input:
        "data/ids.txt"
    output:
        "data/string_ids_query.txt"
    shell:
        "python3 scripts/get_string_ids.py {input} > {output}"

rule get_string_ids:
    input:
        "data/string_ids_query.txt"
    output:
        "data/string_ids.tsv"
    shell:
        "curl -o {output} $(cat {input})"

rule get_string_interaction_partners_query:
    input:
        "data/string_ids.tsv"
    output:
        "data/string_interaction_partners_query.txt"
    shell:
        "python3 scripts/get_interaction_partners.py {input} > {output}"

rule get_string_interaction_partners:
    input:
        "data/string_interaction_partners_query.txt"
    output:
        "data/string_interaction_partners.tsv"
    shell:
        "curl -o {output} $(cat {input})"

rule report:
    input:
        "data/string_ids.tsv",
        "data/string_interaction_partners.tsv"
    output:
        "data/report.html"
    run:
        from snakemake.utils import report
        with open(input[0], "r") as file:
            for i, l in enumerate(file):
                pass
            ids = i+1
        report("""
        A bio-informatics workflow
        ===================================

        RNA_Seq identifiers were isolated and mapped to string-db to get string identifiers
        which were used to find protein-protein interactions (see T2). Information about NCBI taxon
        identifiers, taxon names and gene annotations were gathered as well and can be found
        in T1.

        A total of {ids} genes were processed.
        """, output[0], T1=input[0], T2=input[1])
