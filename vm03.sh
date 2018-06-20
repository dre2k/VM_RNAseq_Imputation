#!/bin/bash
#SBATCH --time=200:00:00
#SBATCH --ntasks=1
#SBATCH --mem=32GB
#SBATCH --account=lc_dvc
#SBATCH --partition=conti
#SBATCH --job-name=vm.wrayner2
#SBATCH --output=vm.wrayner2.log

cd $SLURM_SUBMIT_DIR

for chr in {1..22}
do
    plink --bfile  FIGI_tmp-updated-chr$chr --recode vcf --out FIGI-updated-chr$chr
    vcf-sort FIGI-updated-chr$chr.vcf | bgzip -c > FIGI-updated-chr$chr.vcf.gz     
done
