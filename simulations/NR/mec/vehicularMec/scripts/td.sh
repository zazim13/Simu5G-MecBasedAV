 #! /bin/bash 
cd ..

echo "STARTING">timer.txt
start=`date +%s`


#td
opp_runall ./run  -m -u Cmdenv -n ../../../../emulation:../../..:../../../../src:../../../../../inet/examples:../../../../../inet/showcases:../../../../../inet/src:../../../../../inet/tests/validation:../../../../../inet/tests/networks:../../../../../inet/tutorials:../../../../../veins/examples/veins:../../../../../veins/src/veins:../../../../../veins_inet/src/veins_inet:../../../../../veins_inet/examples/veins_inet --image-path=../../../../images:../../../../../inet/images:../../../../../veins/images:../../../../../veins_inet/images -l ../../../../src/simu5g -l ../../../../../inet/src/INET -l ../../../../../veins/src/veins -l ../../../../../veins_inet/src/veins_inet --debug-on-errors=true -c teleoperated_driving --cmdenv-redirect-output=false

end=`date +%s`
echo "Execution time for td was `expr $end - $start` seconds.">> timer.txt
mv results results_td
mv logs logs_td


end=`date +%s`
echo "Execution time  was `expr $end - $start` seconds.">> timer.txt