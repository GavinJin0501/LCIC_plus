#!/bin/bash
#SBATCH --job-name=test_pretrain
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=12GB
#SBATCH --time=47:59:59
#SBATCH --gres=gpu
#SBATCH -p aquila

# clear all modules
module purge
module load cuda
module load miniconda

# call singularity env
echo "start training"

cd /gpfsnyu/scratch/jj2915/LCIC_plus
source activate torch_env
python test_pretrain.py
conda deactivate

echo "end training"