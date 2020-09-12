#!/bin/bash 
echo "Welcome to  Flip Coin Combination Program"
read -p "Enter no of times loop should be executed " loop
printf "\n"

# declaring dictionary
declare -A combine

head=0
tail=0
echo    "  1-H        3-HH              7-HHH   11-TTH"
echo    "  2-T        4-HT              8-HHT   12-THH"
echo    "             5-TH              9-HTT   13-THT"
echo    "             6-TT              10-TTT  14-HTH"
printf "\n"
for ((i=1;i<=14;i++))
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
                        done
                echo "$maxInd   $((100 * max / loop ))%"
}

echo "1.Singlet Combination :: { H , T } "
echo "2.Doublet Combination :: { HH  HT TH TT }"
echo "3.Triplet Combination :: { HHH HHT HTT TTT TTH THH THT HTH }"
read -p "Enter the number for the required combination " num

case $num in
        1) singlet $loop ;;
        2) doublet $loop ;;
        *) triplet $loop ;;
        esac

