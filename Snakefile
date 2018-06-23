rule get_ids:
    input:
        "data/RNA-Seq-counts.txt"
    output:
        "data/ids.txt"
    script:
        "scripts/get_ids.py"

rule get_functionality:
    input:
        "data/ids.txt"
    output:
        "data/function.txt"
    script:
        "scripts/get_function.py"

rule get_seq:
    input:
        "data/ids.txt"
    output:
        "data/seqs.txt"
    script:
        "scripts/get_seq.py"

rule get_pmids:
    input:
        "data/ids.txt"
    output:
        "data/pmids.txt"
    script:
        "scripts/get_pmids.py"

rule sort_pmids:
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
        "data/seqs.txt",
        "data/pmids_matched.txt",
        "data/pathways.txt"
    output:
        "data/report.txt"
    script:
        "make_report.py"