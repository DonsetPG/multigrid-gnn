#!/bin/bash
Red='\033[0;31m'
Blue='\033[0;34m'
On_Blue='\033[44m'
Green='\033[0;32m'
On_Green='\033[42m'
NC='\033[0m' # No Color

num_epochs=34
mkdir checkpoint
mkdir checkpoint/ablation_study

echo "${Green}================================${NC}"
echo "${Green}===${NC} Launching Ablation Study ${Green}===${NC}"
echo "${Green}================================${NC}"
echo ""
echo "${Blue}Number of epoch used:${NC} ${On_Blue}${num_epochs}${NC}"
echo ""
echo "${Green}================================${NC}"
echo ""
for filename in ablation_study/*.json; do
    parameter_name="${filename%.*}"
    training_parameters_path="${filename}"
    model_save_path="checkpoint/${parameter_name}.pth"
    echo "${Blue}Will train on -> ${NC} ${On_Blue}${parameter_name}${NC}"
done
echo ""
echo "${Green}================================${NC}"
echo ""
for filename in ablation_study/*.json; do
    parameter_name="${filename%.*}"
    training_parameters_path="${filename}"
    model_save_path="checkpoint/${parameter_name}.pth"
    echo "${Green}================================${NC}"
    echo "${Green}Launching training:${NC} ${On_Green}${parameter_name}${NC}"
    echo "${Green}================================${NC}"
    echo ""

    python -m lpm.train_model --num_epochs $num_epochs \
        --training_parameters_path $training_parameters_path \
        --model_save_path $model_save_path

    echo ""
done
