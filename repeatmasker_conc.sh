#!/bin/bash -l

################ SLURM SETTINGS ################
#SBATCH --account=project0005              # Replace with your account/project name
#SBATCH --job-name=repeatmask_conc      # Descriptive job name
#SBATCH --output=%x-%J.out                 # Output file with job name and ID
#SBATCH --error=%x-%J.err                  # Error file
#SBATCH --time=0-10:00:00                  # Max wall time
#SBATCH --mem=20G                          # Total memory per node
#SBATCH --ntasks=1                         # One SLURM task
#SBATCH --cpus-per-task=12                 # Use 16 cores for RepeatMasker
#SBATCH --ntasks-per-node=1
#SBATCH --mail-user=p.campbell.5@research.gla.ac.uk
#SBATCH --mail-type=ALL

################ LOAD MODULES / ENVIRONMENT ################
module load apps/miniforge
conda activate repeatmasker_4.1.8

################# INPUTS #################
GENOME=/users/2320707c/project0005/for_paul_oster/ref_genomes/nxCooOnco1_draft.fa
REPEAT_LIBRARY=/users/2320707c/project0005/for_paul_oster/ref_genomes/repeatm/rmod_conc/c.oncophora_db-families.fa  
OUTDIR=/users/2320707c/project0005/for_paul_oster/ref_genomes/repeatm/rmask_conc

mkdir -p ${OUTDIR}

################ RUN REPEATMASKER ################

RepeatMasker \
  -pa 12 \
  -lib ${REPEAT_LIBRARY} \
  -gff \
  -dir ${OUTDIR} \
  -a \
  -s \
  -poly \
  -small \
  -html \
  -e ncbi \
  ${GENOME}


  
