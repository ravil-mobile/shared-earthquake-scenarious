#!/bin/sh

set -eou

prefix=northridge

#Download the srf file:
wget http://hypocenter.usc.edu/research/SRF/nr6.70-s0000-h0000.txt
#merge line 3 and 4
sed  '3{N;s/\n//;}' nr6.70-s0000-h0000.txt > ${prefix}.srf
sed -i "s/\r//g" ${prefix}.srf

# Now upsample the srf file with this script:
# This assumes SeisSol/SeisSol has been clone in ~
SEISSOL_HOME=/work_fast/ga83dit/project/seissol-northridge

coords="+proj=tmerc +datum=WGS84 +k=0.9996 +lon_0=-118.5150 +lat_0=34.3440"
# not re-sampling
python3 ${SEISSOL_HOME}/preprocessing/science/kinematic_models/refine_srf.py ${prefix}.srf --spatial_zoom 1 --temporal_zoom 1
rconv -i ${prefix}_resampled.srf -o ${prefix}_orig.nrf -m "${coords}" -x visualization_orig.xdmf
rm ${prefix}_resampled.srf 

python3 ${SEISSOL_HOME}/preprocessing/science/kinematic_models/refine_srf.py ${prefix}.srf --spatial_zoom 4 --temporal_zoom 10
rconv -i ${prefix}_resampled.srf -o ${prefix}_rsmp.nrf -m "${coords}" -x visualization_rsmp.xdmf
rm ${prefix}_resampled.srf 


python3 ${SEISSOL_HOME}/preprocessing/science/kinematic_models/refine_srf.py ${prefix}.srf --spatial_zoom 1 --temporal_zoom 10
rconv -i ${prefix}_resampled.srf -o ${prefix}_time.nrf -m "${coords}" -x visualization_time.xdmf
rm ${prefix}_resampled.srf 

rm ./${prefix}.srf

#Now we create the nrf file using:
#build rconv following the procedure described at https://github.com/SeisSol/SeisSol/tree/master/preprocessing/science/rconv
#Then run rconv with:

