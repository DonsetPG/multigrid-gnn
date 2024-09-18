#num_epochs=10
#training_parameters_path="example_epd.json"
#model_save_path="test.pth"
#test_dataset_path="dataset/deepmind_cylinder_10/h5_dataset_cylinder_flow_test.h5"
#test_meta_dataset_path="dataset/deepmind_cylinder_10/meta.json"

#python -m lpm.train_model --num_epochs $num_epochs \
#    --training_parameters_path $training_parameters_path \
#    --model_save_path $model_save_path \
#    --test_dataset_path $test_dataset_path \
#    --test_meta_dataset_path $test_meta_dataset_path

num_epochs=34
training_parameters_path="ablation_study/deepmind-repro-us.json"
model_save_path="checkpoint/test-masked.pth"

python -m lpm.train_model --num_epochs $num_epochs \
    --training_parameters_path $training_parameters_path \
    --model_save_path $model_save_path
