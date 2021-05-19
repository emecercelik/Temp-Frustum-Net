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
#python prepare_data.py 	--gen_tracking_train \
#			--gen_tracking_val \
#			--video_train 0 2 3 4 5 6 7 8 9 10 12 13 14 17 19 20\
#			--video_val 11 15 16 18\
#			--tracking_path '/kitti_root_tracking'\
#			--perturb2d \
#			--name_train '_kitti' \
#			--name_val '_kitti' \
#			--car_only
#			#--video_train 0 2 3 4 5 6 7 8 9 10 12 13 14 17 19 20\
#			#--video_val 11 15 16 18\

python prepare_data.py 	--gen_tracking_train \
			--gen_tracking_val \
			--video_train 0 2 3 4 5 6 7 8 9 10 12 13 14 17 19 20 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55\
			--video_val 30 31 32 33\
			--tracking_path '/kitti_root_tracking'\
			--perturb2d \
			--name_train '_kitti_reverse' \
			--name_val '_kitti_reverse' \
			--car_only
    


