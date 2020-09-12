#!/bin/bash
echo "Welcome to  Flip Coin Combination Program"
read -p "Enter no of times loop should be executed " loop
printf "\n"

#declaring dictionary
declare -A combine

echo    "1-H            3-HH"
echo    "2-T            4-HT"
echo    "               5-TH"
echo    "               6-TT"
printf "\n"
for ((i=1;i<=6;i++))
do
        combine[$i]=0
done

function singlet() {
        for ((i=1;i<=$1;i++))
        do
                random=$((RANDOM%2+1))
                case $random in
                1) combine[1]=$((++combine[1])) ;;
                *) combine[2]=$((++combine[2])) ;;
                esac
        done
                max=0
                for i in ${!combine[@]}
                do
                if [ ${combine[$i]} -gt $max ]
                then
                maxInd=$i
                max=${combine[$i]}
                fi
                done
                echo "$maxInd   $((100 * max / loop ))%"

}


function doublet() {

                for ((i=1;i<=$1;i++))
                do
                random=$(( RANDOM%4+3 ))
                case $random in
                3) combine[3]=$((++combine[3])) ;;
                4) combine[4]=$((++combine[4])) ;;
                5) combine[5]=$((++combine[5])) ;;
                *) combine[6]=$((++combine[6])) ;;
                esac
                done
                max=0
                        for ((i=3;i<=6;i++))
                        do
                                if [ ${combine[$i]} -gt $max ]
                                then
                                maxInd=$i
                                max=${combine[$i]}
                                fi
                        done
                echo "$maxInd   $((100 * max / loop ))%"
}

echo "1.Singlet Combination :: { H , T } "
echo "2.Doublet Combination :: { HH  HT TH TT }"
read -p "Enter the number for the required required " num

case $num in
	    1) singlet $loop ;;
	    2) doublet $loop ;;
	    esac
