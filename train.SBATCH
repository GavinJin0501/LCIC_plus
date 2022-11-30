#!/bin/bash
#SBATCH --job-name=LCIC_plus
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=12GB
#SBATCH --time=167:59:59
#SBATCH --gres=gpu:a100
#SBATCH --output=slurm-train-shoes-new.out
#SBATCH --error=slurm-train-shoes-new.err

# clear all modules
module purge

# call singularity env
singularity exec --nv --overlay /scratch/jj2915/2022_Fall_Capstone/pytorch_env.ext3:ro \
    /scratch/work/public/singularity/cuda11.2.2-cudnn8-devel-ubuntu20.04.sif \
    /bin/bash -c "source /ext3/env.sh; \
                  python train.py --conditional_D --netG progressive_256 --netD basic_256_multi --gan_mode ls --vggLoss --where_add AdaIN --nz 64 --model zvae_wgan \
                                  --dataroot /scratch/jj2915/LCIC_plus/datasets/edges2shoes --batch_size 32 --direction AtoB \
                                  --loadSize 256 --fineSize 256 --input_nc 1 --niter 60 --niter_decay 60 --lr 0.00005 --name 1128; \
                  exit;"