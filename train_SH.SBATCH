#!/bin/bash
#SBATCH --job-name=LCIC_plus
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
python train.py --conditional_D --netG progressive_256 --netD basic_256_multi --gan_mode ls --vggLoss --where_add AdaIN --nz 64 --model zvae_wgan \
                --dataroot datasets/edges2shoes --batch_size 4 --direction AtoB \
                --loadSize 256 --fineSize 256 --input_nc 1 --niter 60 --niter_decay 60 --lr 0.00005

conda deactivate

echo "end training"