#! /bin/bash

BASE_DIR="/lab/work/arushiv/cage/work/reviewer_address_diabetes/gregor"
snakedir="${BASE_DIR}/scripts"
configdir="${BASE_DIR}/configs"
logdir="${BASE_DIR}/logs"
mkdir -p $logdir


# # Run GWAS enrichment
# snakemake -nprs ${snakedir}/Snakefile_GREGOR --rulegraph --configfile ${configdir}/config.yaml | dot -Tsvg > ${configdir}/workflow.svg

# Submit jobs
# snakemake --cluster-config ${configdir}/cluster.yaml \
# 		  --cluster "sbatch --time {cluster.time} --mem {cluster.mem} --cpus-per-task {cluster.cpus} --job-name {cluster.jobname} -o {cluster.output} -e {cluster.error}  --parsable "  \
# 		  -j 60 --latency-wait 400 -prs ${snakedir}/Snakefile_GREGOR --configfile ${configdir}/config.yaml $1


snakemake --cluster-config ${configdir}/cluster.yaml \
		  --cluster "sbatch --time {cluster.time} --mem {cluster.mem} --cpus-per-task {cluster.cpus} --job-name {cluster.jobname} -o {cluster.output} -e {cluster.error}  --parsable "  \
		  -j 60 --latency-wait 400 -prs ${snakedir}/Snakefile_GREGOR --configfile ${configdir}/config_lenient.yaml $1
