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
# --num_point		: Number of points per frustum [default: 1024] only for vkitti
# --vkitti_path 	: Path to the Virtual KITTI dataset.
# --kitti_path 		: Path to the KITTI dataset. Inside should be training/-calib,-image_2,-label_2,-velodyne. default: 'dataset/KITTI/object'
# --gen_tracking_train  : To generate training data from KITTI Tracking.
# --gen_tracking_val    : To generate validation data from KITTI Tracking.
# --tracking_path       : Path to the KITTI tracking dataset. Inside should be data_tracking_<name>/<split>/<name>. <name>:calib,image_02,label_02,velodyne. <split>:training,testing
# --rgb_detection_path  : Path to the KITTI tracking rgb_detections. Inside should be <drive_name>/rgb_detection.txt files according to drives stated in video_val

# To prepare frustum data from KITTI Tracking dataset
python prepare_data.py 	--demo \
			--kitti_path "/media/HDD/object_detection_work/Datasets/KITTI/"\
			--perturb2d \
			--car_only 
    


