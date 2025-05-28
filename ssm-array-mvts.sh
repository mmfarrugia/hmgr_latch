#!/bin/bash

#$ -M mfarrugi@nd.edu
#$ -m ae
#$ -pe smp 32         
#$ -q long            
#$ -N ssm-mvts
#$ -t 1-15

cd /scratch365/mfarrugi/HMGR/SSM/latch_loop

module load rosetta

module load python

module list

which python


chains=('A' 'A' 'A' 'A' 'A' 'A' 'A' 'A' 'A' 'A' 'A' 'A' 'A' 'B' 'B')
indices=(27 28 29 30 31 32 33 34 35 36 48 340 343 439 856)

echo ${chains[$SGE_TASK_ID-1]}
echo ${indices[$SGE_TASK_ID-1]}

mkdir MVTS_${indices[$SGE_TASK_ID-1]}

cd MVTS_${indices[$SGE_TASK_ID-1]}
scp -r ../XXXX/* ./

python3 run_ssm.py ${chains[$SGE_TASK_ID-1]} ${indices[$SGE_TASK_ID-1]}

echo "COMPLETED SSM RUNS BEGINNING ANALYSIS"

conda activate HMGR

which python

python analyze_flex_ddG.py output_saturation

echo "COMPLETED ANALYSIS TASK COMPLETE"
