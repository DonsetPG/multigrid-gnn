model_path="checkpoint/masked/deepmind-repro-us.pth"
training_parameters_path="example_epd_airfoil_cylinder.json"
nb_time_steps=500
save_folder="results/cylinder_on_airfoil_fast"

python -m lpm.run_model --model_path $model_path \
    --training_parameters_path $training_parameters_path \
    --nb_time_steps $nb_time_steps \
    --save_folder $save_folder 