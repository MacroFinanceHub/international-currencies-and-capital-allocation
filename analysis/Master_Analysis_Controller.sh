#!/bin/bash
# INPUT ENVIRONMENT VARIABLES
echo "STEP="$1

# OUTPUT ENVIRONMENT VARIABLES
echo "SLURM_JOB_ID="$SLURM_JOB_ID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURM_SUBMIT_DIR="$SLURM_SUBMIT_DIR
echo "SLURM_ARRAY_TASK_ID="$SLURM_ARRAY_TASK_ID
echo "SLURM_ARRAY_JOB_ID"=$SLURM_ARRAY_JOB_ID
echo "SLURM_ARRAY_TASK_ID"=$SLURM_ARRAY_TASK_ID
echo "SLURM_SUBMIT_DIR="$SLURM_SUBMIT_DIR
 
# LOAD MODULES
mns_code_path="path to mns_code"
module load stata

# RUN CALCULATIONS
umask 007
stata-mp -b "${mns_code_path}/analysis/Master_Analysis.do" ${1} $SLURM_ARRAY_TASK_ID

# FINISHED
echo "Finished Step "${1}
exit