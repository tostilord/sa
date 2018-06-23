rule get_ids:
    input:
        "data/RNA-Seq-counts.txt"
    output:
        "data/ids.txt"
    script:
        "scripts/get_ids.py"

rule get_functionality
    input:
        "data/ids.txt"
    output:
        "data/function.txt"
    script:
        "scripts/get_function.py"

rule get_seq
    input:
        "data/ids.txt"
    output:
        "data/seqs.txt"
    script:
        "scripts/get_seq.py"

rule make_report
    input:
        "data/function.txt"
        "data/seqs.txt"
    output:
        "report.txt"
    script:
        "make_report.py"