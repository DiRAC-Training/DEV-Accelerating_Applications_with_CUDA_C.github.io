#module load python-3.6.1-gcc-5.4.0-64u3a4w py-numpy-1.12.1-gcc-5.4.0-cjrgw2k py-matplotlib-2.2.2-gcc-5.4.0-6oe6fph
#module load py-virtualenv-15.1.0-gcc-5.4.0-gu4wi6c
#virtualenv --system-site-packages ~/jupyter-env
virtualenv --system-site-packages ~/jupyter-srv
#source ~/jupyter-env/bin/activate
source ~/jupyter-srv/bin/activate
pip install jupyter
#pip install kiwisolver
#source ~/jupyter-env/bin/activate
#
#Get comput node ip address
compute_name=`hostname`
compute_ip=`hostname -i`
echo "The compute host is:${compute_name} and it has an ip address od ${compute_ip}" 
echo " "
echo "Please run the following command in a terminal window on you local computer:"
echo "  ssh -L 9562:${compute_name}:9562 -fN [YOUR-ACCONT-NAME]@login-e-2.hpc.cam.ac.uk"

jupyter notebook --no-browser --ip=$compute_ip --port=9562
#jupyter notebook --help-all
