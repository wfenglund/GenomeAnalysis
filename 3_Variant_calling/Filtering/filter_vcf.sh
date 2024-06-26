#! /bin/bash -l
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 10:00:00
#SBATCH -J vcf_filtering

# go to this directory:
cd $PROJECT_DIR
cd 3_Variant_calling/Filtering

# load software modules:
module load bioinfo-tools
module load vcftools

# filter vcf:
vcftools --gzvcf ../vcf_name.vcf.gz --remove-indels --max-missing 0.95 --minQ 30 --min-meanDP 10 --max-meanDP 30 --minDP 10 --maxDP 30 --recode --stdout | gzip -c > filtered_vcf_name.vcf.gz
