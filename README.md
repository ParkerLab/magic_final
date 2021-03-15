MAGIC T2D related trait GWAS enrichment analyses in various genomic annotations

There are directories for the GREGOR, fGWAS and GARFIELD analyses. The workflows were run using [snakemake](http://snakemake.readthedocs.io/en/latest/) version 5.5.0. Ecample configs for a SLURM cluster execution are provided. The analysis directories follow this general pattern:
	```
	├── run.sh : for workflow execution
	├── Snakefile : Snakemake files(s)	
	├── configs
	│   ├── cluster.yaml : Cluster job specifications (SLURM)
	│   └── config.yaml : Workflow configuration (created from mkconfig.py while using environment variables)
	└── scripts : Scripts for analyses
	    ├── script1.py
	    └── script2.R
	```
	Edit the config.yaml providing paths to input files and your email. Given the correct environment variables are set and input data are specificed, example commands in the `run.sh` files can be use to execute analysis or print a dry run. Most software required can be set up by a conda environment. Conda can be obtained through the Anaconda/Miniconda Python3 distribution. 

	### 1. Set up conda and software:
	#### Please install [GREGOR](https://genome.sph.umich.edu/wiki/GREGOR), [fGWAS](https://github.com/joepickrell/fgwas) and [GARFIELD](https://www.ebi.ac.uk/birney-srv/GARFIELD/) required to compute GWAS enrichment in regulatory annotations. Edit the path to the installed programs in the `config.yaml`

	### Analyses
	#### Dry run of <analysis_name>
	```
	./run.sh -n
	```
	#### Run analyses by submitting jobs
	```
	./run.sh
	```