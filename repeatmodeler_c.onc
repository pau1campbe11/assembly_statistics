#!/bin/bash -l

############# SLURM SETTINGS #############
#SBATCH --account=project0005         # account name (mandatory), if the job runs under a project then it'll be the project name, if not then it should =none
#SBATCH --job-name=repeatmod_conc  # some descriptive job name of your choice
#SBATCH --output=%x-%J.out            # output file name will contain job name  + job ID
#SBATCH --error=%x-%J.err             # error file name will contain job name  + job ID
#SBATCH --time=4-00:00:00             # time limit for the whole run, in the form of d-hh:mm:ss, also accepts mm, mm:ss, hh:mm:ss, d-hh, d-hh:mm
#SBATCH --mem=30G                      # memory required per node, in the form of [num][M|G|T]
#SBATCH --ntasks=1                    # number of Slurm tasks to be launched, increase for multi-process runs ex. MPI
#SBATCH --cpus-per-task=15             # number of processor cores to be assigned for each task, default is 1, increase for multi-threaded runs
#SBATCH --ntasks-per-node=1           # number of tasks to be launched on each allocated node
#SBATCH --mail-user=p.campbell.5@research.gla.ac.uk
#SBATCH --mail-type=ALL

############# LOADING MODULES #############

module load apps/miniforge
conda activate repeatmodeler_2.0.6


### Code section

mkdir -p logs

BuildDatabase -name c.oncophora_db /users/2320707c/project0005/for_paul_oster/ref_genomes/nxCooOnco1_draft.fa

RepeatModeler -database c.oncophora_db -threads 15 -LTRStruct > out.log
