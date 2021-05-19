#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue May 19 08:44:53 2020

@author: emec
"""
import os
import argparse
from argparse import Namespace
import IPython
import shutil
import numpy as np
import time
import subprocess as sp

def get_gpu_memory():
  _output_to_list = lambda x: x.decode('ascii').split('\n')[:-1]

  ACCEPTABLE_AVAILABLE_MEMORY = 1024
  COMMAND = "nvidia-smi --query-gpu=memory.free --format=csv"
  memory_free_info = _output_to_list(sp.check_output(COMMAND.split()))[1:]
  memory_free_values = [int(x.split()[0]) for i, x in enumerate(memory_free_info)]
  print(memory_free_values)
  return memory_free_values

def test_one_dir(log_dir,inference_pickle_name=None,model_name=None):
    print('!!!!! Started test in {}'.format(log_dir))
    # Get log file path
    path1 = os.path.join(log_dir,'log_train.txt')
    # Read the network parameters from log file
    f = open(path1,"r")
    lines = f.readlines() 
    params = lines[0]
    # Arguments that the network trained with
    log_args = eval(params)
    # File to save outputs
    if inference_pickle_name is None:
        output_folder_name = 'detection_results'
    else:
        output_folder_name = 'inference_results'
    # Create the test command
    ## These are only for training. No need for test
    no_need_arg_keys = ['batch_size', 'cos_loss_batch_thr', 'cos_loss_prop',
                        'cos_loss_weight','decay_rate','decay_step',
                        'learning_rate','max_epoch','momentum','optimizer',
                        'restore_model_path','log_dir','cos_loss']    
    
    new_command = 'python ../train/test_tracks.py '
    arg_list = log_args._get_kwargs()
    for arg_pair in arg_list:
        arg_key = arg_pair[0]
        arg_val = arg_pair[1]
        
        if arg_key in no_need_arg_keys:
            continue
        
        elif arg_val is None:
            continue
        
        elif type(arg_val) == bool :
            if arg_val == True:
                new_command += ' --{}'.format(arg_key)
                
        elif arg_key == 'pickle_name':
            ## Data path, if the detaulf is selected without providing pickle name
            if log_args.tracking:
                data_path = 'frustum_carpedcyc_tracking_val.pickle'
            else:
                data_path = 'frustum_carpedcyc_val.pickle'
            ## If the pickle name is specified during training
            if arg_val is not None:
                data_path = log_args.pickle_name+'_val.pickle'
            ## If the data is chosen as inference
            if inference_pickle_name is not None:
                data_path = inference_pickle_name
                new_command += ' --from_rgb_detection'        
            new_command += ' --data_path {}'.format(os.path.join('../kitti',data_path))

        else:
            if arg_key == 'layer_sizes':
                _arg_val = arg_val
                arg_val = ''
                for ar in _arg_val:
                    arg_val = arg_val + str(ar) + ' '
            new_command+=' --{} {}'.format(arg_key,arg_val)
    
    if os.path.exists(os.path.join(log_dir,output_folder_name)): 
        shutil.rmtree(os.path.join(log_dir,output_folder_name))

    new_command += ' --output {}'.format(os.path.join(log_dir,output_folder_name))
    if model_name is None:
        new_command+= ' --model_path {}'.format(os.path.join(log_dir,'model.ckpt'))
    else:
        new_command+= ' --model_path {}'.format(os.path.join(log_dir,model_name))
    
    gpu_check=True
    if gpu_check:
        # Run the command
        while(1):
            print('*******************************\ncheck memory\n****************************')
            if get_gpu_memory()[0]> 3500:
                os.system(new_command)
                break
            else:
                time.sleep(1)
    else:
        os.system(new_command)

def get_folder_names(path):
    log_directories = [os.path.join(path,p) for p in os.listdir(path)\
                       if os.path.isdir(os.path.join(path,p))]
    return log_directories

def run_eval(log_dir,gt_root_dir,pickle_name=None):
    if pickle_name is None:
        detection_folder_name = 'detection_results'
    else:
        detection_folder_name = 'inference_results'
    drives = get_folder_names(os.path.join(log_dir,detection_folder_name,'data'))
    for drive_name in drives:
        gt_dir = os.path.join(gt_root_dir,os.path.basename(drive_name))
        print(drive_name,gt_dir)
        command_eval = '../train/kitti_eval/evaluate_object_3d_offline {} {}'.format(\
                                                                             gt_dir,drive_name)
        os.system(command_eval)


def read_summary(sum_dir):
    f = open(sum_dir,"r")
    lines = f.readlines()
    res_dict = {}
    # read the summary file
    for line in lines:
        # Get the result type with the AP metrics
        key_raw,res_raw = line.split(':')
        # Split the raw result type
        key = key_raw.split(' ')[0]
        # Gen a new key wit hthe result type
        res_dict[key] = {}        
        # Read AP values
        _,easy,moderate,hard = res_raw.split(' ')
        # Record AP values acc to the diff level
        res_dict[key]['easy']=float(easy)
        res_dict[key]['moderate']=float(moderate)
        res_dict[key]['hard']=float(hard)
    return res_dict

def get_summary_drive(log_dir):
    '''
    To read evaluation results of AP, which are written in a summary.txt file
    in the respective folder that belongs to the evaluated drive id. 
    '''
    results_dict=dict()
    results_dict['drives']=[os.path.basename(path) for path in get_folder_names(os.path.join(log_dir,'detection_results','data'))]
    
    for drive_name in results_dict['drives']:
        sum_path = os.path.join(log_dir,'detection_results','data',drive_name,'plot','summary.txt')
        sum_dict=read_summary(sum_path)
        results_dict[drive_name]=sum_dict
    
    return results_dict

def write_model_evals(log_dir,model_results):
    f = open(os.path.join(log_dir,'modelEvals.txt'),'w')
    model_names = list(model_results.keys())
    model_names_indices = [int(model_name.split('_')[1].split('.')[0]) for model_name in model_names]
    model_names_indices.sort()
    drive_sorted = model_results[model_names[0]]['drives']
    drive_sorted.sort()
    for drive in drive_sorted:
        f.write('{}\n'.format(drive))
        f.write('{:>15} {:>15} {:>15} {:>15} {:>15}\n'.format('Model Name','3D AP', 'Easy', 'Moderate', 'Hard '))
        for model_id in model_names_indices:
            model_name = 'model_{}.ckpt'.format(model_id)
            categories = model_results[model_name][drive].keys()
            for cat in categories:
                if cat[-3:] == '_3d':
                    res = model_results[model_name][drive][cat]
                    f.write('{:>15} {:>15} {:>15} {:>15} {:>15}\n'.format(model_name,cat.split('_')[0], res['easy'], res['moderate'],res['hard']))
            
    '''        
    for model_id in model_names_indices:
        model_name = 'model_{}.ckpt'.format(model_id)
        f.write('{}\n'.format(model_name))
        drive_sorted = model_results[model_name]['drives']
        drive_sorted.sort()
        for drive in model_results[model_name]['drives']:
            categories = model_results[model_name][drive].keys()
            f.write('{:>15} {:>15} {:>15} {:>15}\n'.format('3D AP', 'Easy', 'Moderate', 'Hard '))
            for cat in categories:
                if cat[-3:] == '_3d':
                    res = model_results[model_name][drive][cat]
                    f.write('{:>15} {:>15} {:>15} {:>15}\n'.format(cat.split('_')[0]+drive, res['easy'], res['moderate'],res['hard']))
    '''
    f.close()
     
if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--log_dir',default=None,help='Path to a single log folder that contains log files of a training. This is overwritten by log_dirs if given.')
    parser.add_argument('--log_dirs',default=None,help='Path to log folders. Inside there should be log_* folders that contains logs of a training.')
    parser.add_argument('--gt_root_dir',default=None,help='Path to root dir of ground-truth tracking labels')
    parser.add_argument('--pickle_name',default=None,help='Name of the pickle file to be used in inference. If this is None, the pickle file used for evaluation will be used.')
    parser.add_argument('--multi_model', action='store_true', default=False, help="To evaluate all the models that were saved in one training. ")
    args = parser.parse_args()
    
    
    if args.log_dirs is not None:
        log_directories = get_folder_names(args.log_dirs)
    else:
        log_directories = [args.log_dir]
    

    for log_dir in log_directories:
        try:
            if args.multi_model:
                model_ids = list(set([int(l.split('.')[0].split('_')[1]) for l in os.listdir(log_dir) if l[0:6]=='model_']))
                model_ids.sort()
                model_names = ['model_{}.ckpt'.format(ind) for ind in model_ids]
                #model_names = list(set(['model_{}.ckpt'.format(l.split('.')[0].split('_')[1]) for l in os.listdir(log_dir) if l[0:6]=='model_']))
                model_results = dict()
                for model_name in model_names:
                    print('***** \nStarted Test of Model: {} \n*****'.format(model_name))
                    test_one_dir(log_dir,args.pickle_name,model_name)
                    if args.gt_root_dir is not None:
                        run_eval(log_dir,args.gt_root_dir,args.pickle_name)
                    model_results[model_name] = get_summary_drive(log_dir)
                    np.save(os.path.join(log_dir,'modelEval.npy'),model_results)
                
                write_model_evals(log_dir,model_results)
                    
            else:
                test_one_dir(log_dir,args.pickle_name)
                if args.gt_root_dir is not None:
                    run_eval(log_dir,args.gt_root_dir,args.pickle_name)
        except Exception as exc:
            print('***** Failed in {}'.format(log_dir))
            print(exc)
    
            
