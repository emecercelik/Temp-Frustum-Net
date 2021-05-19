#/bin/bash

## Train on KITTI tracking data

# paths to save data and logs
TIME_PATH=/root_3d_log/kitti_paper_runs

# Copy model_util with kitti mean sizes
cp /frustum_framework/frustum-pointnets/models/model_util_kitti.py /frustum_framework/frustum-pointnets/models/model_util.py

# Please see the README in this folder for the meanings of flags
# Train with  the provided parameters

#####################################333
## ONE_BRANCH
#######################################3

# RNN tau3 

LOG_NAME="log_time_s0"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s1"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s2"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

## RNN tau1

LOG_NAME="log_time_s3"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 1\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s4"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 1\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s5"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 1\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

## Conv tau3

LOG_NAME="log_time_s6"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 3\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s7"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 3\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s8"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 3\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

## Conv tau1

LOG_NAME="log_time_s9"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s10"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s11"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


## Conv tau6

LOG_NAME="log_time_s12"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s13"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s14"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

#############################################
###### TWO_BRANCH
#############################################

# RNN tau3 

LOG_NAME="log_time_s15"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s16"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s17"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

## RNN tau1

LOG_NAME="log_time_s18"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 1\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s19"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 1\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s20"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 1\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

## Conv tau3

LOG_NAME="log_time_s21"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s22"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s23"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

## Conv tau1

LOG_NAME="log_time_s24"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s25"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s26"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


## Conv tau6

LOG_NAME="log_time_s27"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s28"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s29"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 1\
				--learning_rate 0.001 \
				--two_branch \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 










LOG_NAME="log_time_s79"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s80"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 6\
				--learning_rate 0.001 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s81"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s82"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.0005 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 



LOG_NAME="log_time_s83"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s84"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 6\
				--learning_rate 0.001 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s85"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s86"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.0005 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 



LOG_NAME="log_time_s87"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s88"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net conv\
				--track_features fc2 \
				--tau 6\
				--learning_rate 0.001 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 

LOG_NAME="log_time_s89"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.001 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 


LOG_NAME="log_time_s90"
LOG_PATH=$TIME_PATH/$LOG_NAME
python ../train/train.py 	--gpu 0 \
				--tracking \
				--model frustum_pointnets_v1 \
				--log_dir $LOG_PATH \
				--num_point 1024 \
				--max_epoch 101 \
				--batch_size 32 \
				--decay_step 800000 \
				--decay_rate 0.5 \
				--no_intensity \
				--tracks \
				--track_net lstm\
				--track_features fc1 \
				--tau 3\
				--learning_rate 0.0005 \
				--two_branch \
				--only_whl \
				--add_center \
				--temp_attention \
				--pickle_name frustum_caronly_tracking_kitti 

python run_all_logs.py --log_dir $LOG_PATH --gt_root_dir /kitti_root_tracking/drives_in_kitti --multi_model 
