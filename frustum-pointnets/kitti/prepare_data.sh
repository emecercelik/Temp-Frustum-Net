#!/bin/bash

## Arguments
# --demo 		: Run demo
# --gen_train 		: Generate KITTI train split frustum data with perturbed GT 2D boxes
# --gen_val 		: Generate KITTI val split frustum data with GT 2D boxes 
# --gen_vkitti_train 	: To generate training data from Virtual KITTI
# --gen_vkitti_val 	: To generate val data from Virtual KITTI
# --car_only'		: Only generate cars; otherwise cars, peds and cycs
# --perturb2d 		: To apply 2D perturbation as augmentation
# --perturb3d 		: To apply 3D perturbation as augmentation
# --video_train 1 6 20 	: To generate training data from Virtual KITTI drives of 1,6, and 20
# --video_val 2 18 	: To generate val data from Virtual KITTI drives of 2 and 18
# --name_train _2d3d 	: To add a postfix(_2d3d here) to the name of saved pickle file for training data
# --name_val _2d3d 	: To add a postfix (_2d3d here) to the name of saved pickle file for val
# --num_point		: Number of points per frustum [default: 1024]
# --vkitti_path 	: Path to the Virtual KITTI dataset.
# --kitti_path 		: Path to the KITTI dataset. Inside should be training/-calib,-image_2,-label_2,-velodyne. default: 'dataset/KITTI/object'

# To prepare KITTI training and validation data
python prepare_data.py --gen_train --gen_val --perturb2d \
 	--kitti_path '/kitti_root_3d'


