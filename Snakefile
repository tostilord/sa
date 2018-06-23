rule get_ids:
    input:
        "data/RNA-Seq-counts.txt"
    output:
        "data/ids.txt"
    script:
        "scripts/get_ids.py"
