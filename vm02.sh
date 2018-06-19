#!/bin/bash

run.wrayner () {

REF=/auto/pmd-02/figi/andreeki/Refs

echo "#!/bin/bash
#SBATCH --time=200:00:00
#SBATCH --ntasks=1
#SBATCH --mem=64GB
#SBATCH --account=lc_dvc
#SBATCH --partition=conti
#SBATCH --job-name=vm.wrayner
#SBATCH --output=vm.wrayner.log

cd $SLURM_SUBMIT_DIR

plink --bfile $1 --freq --nonfounders --out tmp.$1
perl ${REF}/HRC-1000G-check-bim-NoReadKey.pl -b $1.bim -f tmp.$1.frq -r ${REF}/HRC.r1-1.GRCh37.wgs.mac5.sites.tab -h -n 

    " | sbatch
}


run.wrayner "FIGI_tmp"
