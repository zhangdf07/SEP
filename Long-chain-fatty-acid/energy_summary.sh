#!/bin/bash

echo 'Energy | Free Energy | JobID | Solvent Name'
for j in job_*;do
  cd $j
  if [ -f job-input-orca.log ]; then
    solvent=`grep SMDSOLVENT input-orca`
    e=(`grep FINAL job-input-orca.log | tail -1`)
    e=${e[4]}
    fe=(`grep 'Final Gibbs free energy' job-input-orca.log`)
    fe=${fe[5]}
    echo $e '|' $fe '|' $j '|' ${solvent:10}

    #grep -15  "VIBRATIONAL FREQUENCIES" job-input-orca.log | tail -n +21  ## Freq
    image=`grep "imaginary mode" job-input-orca.log`
    #if ! [[ -z $image ]]; then
	#echo $image $j
	#cp input-orca.xyz  data-in.xyz
	#python ../../rattle_ase.py
        #sbatch ../../run_ORCA.sh
    #fi
  fi
  cd ../
done

