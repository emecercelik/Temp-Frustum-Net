#!/bin/bash

# Port bindings: -p host_port:container_port
# Port bindings: -p host_port:container_port
read -p "Tensorboard port (host) "  TboardHostPort
read -p "Jupyter Notebook port (host) "  JupyHostPort

# Path where the KITTI object detection dataset for 3D detection is kept
kitti_root_3d="/media/HDD/object_detection_work/Datasets/KITTI/"
# Path where the KITTI tracking dataset for 2D and 3D detection is kept
kitti_root_tracking="/media/HDD/tracking_dataset/KITTI/"
# Path where the 3d detection log files are generated
root_3d_log="/media/HDD2/trainings/frustum_pointnet"
# Path to the codes
frustum_framework="/media/HDD/projects/frustum_framework"
docker run -it --gpus all --rm  -v $kitti_root_3d:/kitti_root_3d \
				-v $kitti_root_tracking:/kitti_root_tracking \
				-v $root_3d_log:/root_3d_log \
				-v $frustum_framework:/frustum_framework \
				-p $JupyHostPort:8888 \
				-p $TboardHostPort:6006 \
				emecercelik/tum-i06-object_detection:faster_frustum_nonroot_v3 
