#!/bin/bash

#SBATCH --job-name=dummy                              # Job name
#SBATCH --ntasks=40                                   # Number of CPUs
#SBATCH --time=168:00:00                              # Time limit hrs:min:sec
#SBATCH --output=sacsma/log_files/dummy.log           # Standard output and error log
#SBATCH --exclude=gpu01                               # Don't hog the GPU node


# memory
ulimit -s unlimited

# location
cd path
pwd

# load conda environment
source /home/lmqualls/.bashrc
conda activate sacsma

# run code
python batch_run_experiment.py --config_file=${1} --max_model_runs=${2} --algorithm=${3}
