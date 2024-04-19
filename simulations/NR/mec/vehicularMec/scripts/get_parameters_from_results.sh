 #! /bin/bash 
cd ..

use_case="cooperative_sensing"
echo "frequency,numerology,nb_vehicle,rb,edge_cpu,rep,runnumber">myparameters_$use_case.csv
echo "frequency,numerology,nb_vehicle,rb,edge_cpu,rep,runnumber">/home/hakim/jupyter_dir/enhancing_paper/myparameters_$use_case.csv


frequency_list=("700MHz")
numerology_list=("0" "1" "2" "3")
rb_list=("35" "70" "139" "278" )
rep_list=({0..5})
number_vehicle_list=({0..10})  # Replace with your actual vehicle values
edgeCPU_list=("2356230" "749070" "412090" "346350" "221720")  # Replace with your actual edge CPU values

for frequency in "${frequency_list[@]}"
do
    for numerology in "${numerology_list[@]}"
    do
        for number_vehicle in "${number_vehicle_list[@]}"
        do
            for rb in "${rb_list[@]}"
            do
                for edgeCPU in "${edgeCPU_list[@]}"
                do
                    for rep in "${rep_list[@]}"
                    do
                        file="_results/$use_case/$frequency/$numerology/$number_vehicle/$rb/$edgeCPU/$rep.sca"
                        if [ -f "$file" ]; then
                            runnumber=$(grep runnumber "$file" | cut -d" " -f3 | sed -n 1p)
                            echo $frequency,$numerology,$number_vehicle,$rb,$edgeCPU,$rep,$runnumber >> myparameters_$use_case.csv
                            echo $frequency,$numerology,$number_vehicle,$rb,$edgeCPU,$rep,$runnumber >> /home/hakim/jupyter_dir/enhancing_paper/myparameters_$use_case.csv
							echo $file
						else
							echo ..
                            #echo "File not found: $file"
                        fi
                    done
                done
            done
        done
    done    
done
