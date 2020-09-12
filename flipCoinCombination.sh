#!/bin/bash -x
echo "Welcome to  Flip Coin Combination Program"
read -p "Enter no of times loop should be executed " loop
printf "\n"

# Declaring the dictionary
declare -A combine

echo    "  1-H        3-HH              7-HHH   11-TTH"
echo    "  2-T        4-HT              8-HHT   12-THH"
echo    "             5-TH              9-HTT   13-THT"
echo    "             6-TT              10-TTT  14-HTH"
printf "\n"

# assigning dictionary "combine"initial value zero

for ((i=1;i<=14;i++))
do
        combine[$i]=0
done

function singlet() {

        for ((i=1;i<=$1;i++))
        do
                random=$((RANDOM%2+1))
                case $random in
                1) combine[1]=$(( ++combine[1] )) ;;
                *) combine[2]=$(( ++combine[2] )) ;;
                esac
        done
                max=0
        for ((i=1;i<=2;i++))
        do
                if [ ${combine[$i]} -gt $max ]
                then
                maxInd=$i
                max=${combine[$i]}
                fi
		arr1[i]="$((100 * ${combine[$i]} / $1))"	
        done
        echo "$maxInd --> $(( 100 * max / $1 ))%"


        echo "Sorted Singlet Combination"

        if  [ ${arr1[1]} -ge ${arr1[2]} ]
        then echo "${arr1[1]} ${arr1[2]}"
        else echo "${arr1[2]} ${arr1[1]}"
        fi
}

function doublet() {

                for ((i=1;i<=$1;i++))
                do
                random=$(( RANDOM%4+3 ))
                case $random in
                3) combine[3]=$(( ++combine[3] )) ;;
                4) combine[4]=$(( ++combine[4] )) ;;
                5) combine[5]=$(( ++combine[5] )) ;;
                *) combine[6]=$(( ++combine[6] )) ;;
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
                        arr2[i]="$(( 100 * ${combine[$i]} / $1 ))"
                        done
                echo "$maxInd --> $(( 100 * max / $1 ))%"


                echo "Sorted Doublet Combination :"
                for ((i=3;i<=6;i++))
                do
                        for ((j=3;j<=6;j++))
                        do
                        if [[ ${arr2[j+1]} -ge ${arr2[j]} ]]
                        then
                        arr2[j+1]=$((arr2[j+1]+arr2[j]))
                        arr2[j]=$((arr2[j+1]-arr2[j]))
                        arr2[j+1]=$((arr2[j+1]-arr2[j]))
                        fi
                        done
                done
                echo ${arr2[@]}
}


function triplet() {
                for ((i=1;i<=$1;i++))
                do
                        random=$((RANDOM%8+7))
                        case $random in
                        7) combine[7]=$((++combine[7])) ;;
                        8) combine[8]=$((++combine[8])) ;;
                        9) combine[9]=$((++combine[9])) ;;
                        10) combine[10]=$((++combine[10])) ;;
                        11) combine[11]=$((++combine[11])) ;;
                        12) combine[12]=$((++combine[12])) ;;
                        13) combine[13]=$((++combine[13])) ;;
                        *) combine[14]=$((++combine[14])) ;;
                        esac
                done

                max=0
                for ((i=7;i<=14;i++))
                do
                          if [ ${combine[$i]} -gt $max ]
                          then
                                maxInd=$i
                                max=${combine[$i]}
                          fi
                arr3[i]="$(( 100 * ${combine[$i]} / $1 ))"
                done
                echo "$maxInd -->  $((100 * max / loop ))%"

                echo "Sorted Triplet Combination :"
                for ((i=7;i<=14;i++))
                do
                        for ((j=7;j<=14;j++))
                        do
                        if [[ ${arr3[j+1]} -ge ${arr3[j]} ]]
                        then
                        arr3[j+1]=$((arr3[j+1]+arr3[j]))
                        arr3[j]=$((arr3[j+1]-arr3[j]))
                        arr3[j+1]=$((arr3[j+1]-arr3[j]))
                        fi
                        done
                done
                echo ${arr3[@]}
}

echo "1.Singlet Combination -- { H  T }"
echo "2.Doublet Combination -- { HH  HT TH TT }"
echo "3.Triplet Combination -- { HHH HHT HTT TTT TTH THH THT HTH }"
read -p "Enter the number for the required combination" num

case $num in
        1) singlet $loop ;;
        2) doublet $loop ;;
        *) triplet $loop ;;
        esac


