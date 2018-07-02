rule get_ids:
    input:
        "data/RNA-Seq-counts.txt"
    output:
        "data/ids.txt"
    shell:
        "python3 scripts/get_ids.py {input} > {output}"

rule get_functionality:
    input:
        "data/ids.txt"
    output:
        "data/function.txt"
    script:
        "scripts/get_function.py"

rule get_seq:
    input:
        "data/pmids.txt"
    output:
        "data/seqs.txt"
    script:
        "scripts/get_seq.py"

rule get_gc:
    input:
        "data/seqs.txt"
    output:
        "data/gc.txt"
    script:
        "scripts/get_gc.py"

rule get_pmids:
    input:
        "data/ids.txt"
    output:
        "data/pmids.txt"
    script:
        "scripts/get_pmids.py"

rule pmids_sorter:
    input:
        "data/pmids.txt"
    output:
        "data/pmids_sorted.txt"
    script:
        "scripts/pmid_sorter.py"

rule pmid_matcher:
    input:
        "data/pmids_sorted.txt"
    output:
        "data/pmids_matched.txt"
    script:
        "scripts/pmid_matcher.py"

rule get_pathways:
    input:
        "data/pmids.txt"
    output:
        "data/pathways.txt"
    script:
        "scripts/get_pathways.py"

rule make_report:
    input:
        "data/function.txt",
        "data/pmids_matched.txt",
        "data/pathways.txt",
        "data/gc.txt"
    output:
        "data/report.txt"
    script:
        "make_report.py"