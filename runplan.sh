plexilc $1
plan=$1
echo $plan
echo Executing "${plan%?}"x
plexilexec -p "${plan%?}"x
