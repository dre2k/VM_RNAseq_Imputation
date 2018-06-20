plink --bfile /auto/pmd-02/figi/andreeki/Data/Victor_RNAseq/Genotypes/pre-imputation/FIGI_merged --missing --nonfounders --out tmp2

# 0.18 should filter out 9 samples
plink --bfile /auto/pmd-02/figi/andreeki/Data/Victor_RNAseq/Genotypes/pre-imputation/FIGI_merged  --mind 0.18  --make-bed --out FIGI_tmp

awk '{if($6 > 0.18) {print}}' tmp2.imiss > excluded_samples.txt
