echo "Welcome to the Flip Coin Combination Program"
#!/bin/bash
echo "Welcome to  Flip Coin Combination Program"
read -p "Enter no of times loop should be executed " loop
printf "\n"

#declaring dictionary
declare -A combine

echo    "1-H"
echo    "2-T"
printf "\n"
for ((i=1;i<=2;i++))
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
echo "Singlet Combination :: { H , T } "
singlet $loop
