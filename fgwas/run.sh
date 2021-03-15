#! /bin/bash

configdir="configs"
logdir="logs"
mkdir -p $logdir


# # single annot results
snakemake --cluster-config ${configdir}/cluster.yaml \
		  --cluster "sbatch --time {cluster.time} --mem {cluster.mem} --cpus-per-task {cluster.cpus} --job-name {cluster.jobname} -o {cluster.output} -e {cluster.error}  --parsable "  \
		  -j 60 --latency-wait 400 -prs Snakefile --configfile ${configdir}/config.yaml $1


