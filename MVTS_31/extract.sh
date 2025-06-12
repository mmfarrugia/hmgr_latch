#!/bin/bash

#$ -M mfarrugi@nd.edu
#$ -m ae
#$ -pe smp 8         
#$ -q long            
#$ -N extract-structs

cd /scratch365/mfarrugi/HMGR/SSM/latch_loop/MVTS_31

module load rosetta

conda activate HMGR

module list

which python

python extract_structures.py output_saturation

