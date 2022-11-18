#!/bin/bash
#SBATCH --job-name=LCIC_plus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=12GB
#SBATCH --time=47:59:59

# clear all modules
module purge

# call singularity env
singularity exec --nv --overlay /scratch/jj2915/2022_Fall_Capstone/pytorch_env.ext3:ro \
    /scratch/work/public/singularity/cuda11.2.2-cudnn8-devel-ubuntu20.04.sif \
    /bin/bash -c "source /ext3/env.sh; \
    python hello_world.py; \
    exit;"