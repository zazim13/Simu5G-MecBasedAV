 #! /bin/bash 
cd ..

use_case="teleoperated_driving"
echo "frequency,numerology,nb_vehicle,rb,edge_cpu,rep,runnumber">myparameters_$use_case.csv
#echo "frequency,numerology,nb_vehicle,rb,edge_cpu,rep,runnumber">/home/hakim/jupyter_dir/enhancing_paper/myparameters_$use_case.csv


frequency_list=("700MHz")
numerology_list=("0")
rb_list=("50" "100" "150")
rep_list=({0..2})
number_vehicle_list=("1") 
edgeCPU_list=("133740" "147600" "176170" "221720" "298190")  

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
