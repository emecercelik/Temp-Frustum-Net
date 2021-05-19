#!/bin/bash

TRAINING_NAME='train_bmw_v3'
python tracking2rgb_detections.py 	--tracking_path /root_2d_log/validation/$TRAINING_NAME/predictions_dist/0.9 \
					--drive_ids 3 4 43 44 \
					--rgb_det_path /root_2d_log/rgb_detections_from_predictions/$TRAINING_NAME/


