#! /bin/bash

snakedir="scripts"
configdir="configs"

mkdir -p "logs"

# Organize data
snakemake --cluster-config ${configdir}/cluster.yaml \
		  --cluster "sbatch --time {cluster.time} --mem {cluster.mem} --cpus-per-task {cluster.cpus} --job-name {cluster.jobname} -o {cluster.output} -e {cluster.error}  --parsable" \
		  -j 60 -p --latency-wait 4 -prs ${snakedir}/Snakefile_organize_data --configfile ${configdir}/config.yaml $1

# garfield
snakemake --cluster-config ${configdir}/cluster.yaml \
		  --cluster "sbatch --time {cluster.time} --mem {cluster.mem} --cpus-per-task {cluster.cpus} --job-name {cluster.jobname} -o {cluster.output} -e {cluster.error}  --parsable" \
		  -j 60 -p --latency-wait 4 -prs ${snakedir}/Snakefile_garfield --configfile ${configdir}/config.yaml $1

