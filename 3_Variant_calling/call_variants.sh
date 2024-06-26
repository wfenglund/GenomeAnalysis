#! /bin/bash -l
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 10:00:00
#SBATCH -J variant_calling

# go to the correct directory:
cd $PROJECT_DIR
cd 3_Variant_calling/

# load software modules:
module load bioinfo-tools
module load bcftools

# call variants:
bcftools mpileup -a AD,DP,SP -Ou -f ../0_Reference/reference_name.fna ../2_Mapped/*.bam | bcftools call -f GQ,GP -v -mO z -o ./output_name.vcf.gz 
