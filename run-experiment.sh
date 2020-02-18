echo 'Mapped Experiments'
echo 

count=0
experiments=experiments/*
experiments=($experiments)
echo $experiments
for file in $experiments
do
    echo "[$count] $(basename "$file")"
    count=$((count+1))
done

echo
echo -ne 'Insert the index or name for one of the above: '
read selected_experiment

found=false
re='^[0-9]+$'
if [[ $selected_experiment =~ $re ]]; then
   found=true
   selected_experiment=`basename ${experiments[$selected_experiment]}`
else
    for file in $experiments
    do
        fname=`basename $file`
        if [[ $selected_experiment == $fname ]]; then
            found=true
        fi
    done
fi
if [ $found == true ]; then
    entrypoint=main.py

    echo "[$selected_experiment] Running..."
    # echo "[$selected_experiment] Select entrypoint [default==main.py]"

    docker run \
        -it \
        --name devenv_$selected_experiment \
        --env-file .env \
        --net=shared_network \
        -v "$(pwd)"/src:/home/tars/src \
        -v "$(pwd)"/notebooks:/home/tars/notebooks \
        -v "$(pwd)"/data:/home/tars/data \
        -v "$(pwd)"/experiments:/home/tars/experiments \
        devenv:1.0 \
        python3 experiments/$selected_experiment/$entrypoint

else
    echo "Invalid name...exiting."
fi