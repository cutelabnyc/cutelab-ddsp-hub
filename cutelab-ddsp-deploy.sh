#!/bin/bash

ddsp_prepare_tfrecord  \
    --input_audio_filepatterns=gs://transference-dump/audio-files/*.wav \
    --output_tfrecord_path=gs://transference-dump/in/train.tfrecord \
    --num_shards=10 \
    --alsologtostderr
    
ddsp_run --mode=train --alsologtostderr --save_dir=gs://transference-dump/out \
    --gin_file=models/solo_instrument.gin \
    --gin_file=datasets/tfrecord.gin \
    --gin_param="TFRecordProvider.file_pattern='gs://transference-dump/in/train.tfrecord*'" \
    --gin_param=batch_size=16 \
    --gin_param=train_util.train.num_steps=5000 \
    --gin_param=train_util.train.steps_per_save=300 \
    --gin_param=trainers.Trainer.checkpoints_to_keep=10