model_path="checkpoint/masked/w-cycle-best.pth"
training_parameters_path="ablation_study/w-cycle.json"

python -m lpm.evaluate_model --model_path $model_path \
    --training_parameters_path $training_parameters_path