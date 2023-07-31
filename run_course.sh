#!/bin/bash
#
#This script is desined to request a GPU node from a DiRAC system 
#so the user can stat a jupyter notebook.
#
###
#
#Course details
course_nodes=1
course_node_type="gpu:1"
course_duration="02:00:00"
course_tasks=1
course_cpu_tasks=3
course_partition2="pascal"
course_partition1="ampere"
course_project="dirac-dt001-gpu"
#
login_node=`hostname`
#
#Check to hostname to determine which DiRAC systyem the user is on
#
cambridge_Server='login-e'
durham_Server='login8'

case $login_node in
	*"$cambridge_Server"*)
	  echo "Login to CS4 syem at Cambridge."
	  system="CS4"
	  ;;
	*"$durham_Server"*)
	  echo "Login to MI system at Durham"
          system="MI"
	  ;;
esac

echo "Welcome. You are login to ${system}."
echo " "
read -p "If you have a slurm reservation, please enter the name:" slurm_reservation
echo " "
if [ -z "$slurm_reservation" ]; then
   echo "No reservation."
else
   echo "Thank you. Your reservation '${slurm_resevation}' will be used"
fi

nodes_available=`sinfo | grep $course_partition1 | grep idle`
if [ "${nodes_available}" ]; then
	#echo "1. ${nodes_available}"
	echo "Nodes are available. Requesting ${course_nodes} nodes on ${course_partition1}"
        partition_used=$course_partition1
else
	echo "Sorry no ${course_partition1} nodes are availble"
	if [ $course_partition2 ]; then	
        	nodes_available=`sinfo | grep $course_partition2 | grep idle`
        	if [ "${nodes_available}" ]; then
			read -p "Nodes are available on ${course_partition2}. Do you want to continue (y/n)?" yn
			case $yn in 
				[yY] ) echo ok, we will proceed;
				        echo "Requesting ${course_nodes} nodes on ${course_partition2}";
        		 		partition_used=$course_partition2;
					;;
				[nN] ) echo exiting...;
					exit;;
				* ) echo invalid response, exiting;;
			esac


		else
			echo "Sorry no ${course_partition2} nodes are availble"
		fi
	fi
fi

if [ "${nodes_available}" ]; then
	## Nodes are available
	if [ "${slurm_resevation}" ]; then
		## A resevation is available
		srun -t $course_duration --reservation=$slurm_resevation --nodes=$course_nodes --gres=$course_node_type --ntasks-per-node=$course_tasks --cpus-per-task=$course_cpu_tasks --partition=$partition_used --account=$course_project --pty -u bash -i
	else
		## No resevation was set up.
		srun -t $course_duration --nodes=$course_nodes --gres=$course_node_type --ntasks-per-node=$course_tasks --cpus-per-task=$course_cpu_tasks --partition=$partition_used --account=$course_project --pty -u bash -i
	fi
#else
	## No nodes were available
	#srun -t $course_duration --nodes=$course_nodes --gres=$course_node_type --ntasks-per-node=$course_tasks --cpus-per-task=$course_cpu_tasks --partition=$course_partition1 --account=$course_project ./startJupyter.sh
fi

