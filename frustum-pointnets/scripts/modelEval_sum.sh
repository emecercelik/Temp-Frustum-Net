#!/bin/bash


python modelEval_sum.py		--main_path /root_3d_log/kitti_better_scores4 \
				--output_name two_branch-only_whl-car-0_29\
				--prefix log_time_s \
				--log_indices 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28\
				--params_to_group tau track_net track_features learning_rate rnn_cell_type cos_loss\
				--detection_type car_detection_3d

python modelEval_sum.py		--main_path /root_3d_log/kitti_better_scores4 \
				--output_name two_branch-only_whl-ped-0_29\
				--prefix log_time_s \
				--log_indices 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28\
				--params_to_group tau track_net track_features learning_rate rnn_cell_type cos_loss\
				--detection_type pedestrian_detection_3d

python modelEval_sum.py		--main_path /root_3d_log/kitti_better_scores4 \
				--output_name two_branch-only_whl-cyc-0_29\
				--prefix log_time_s \
				--log_indices 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28\
				--params_to_group tau track_net track_features learning_rate rnn_cell_type cos_loss\
				--detection_type cyclist_detection_3d



