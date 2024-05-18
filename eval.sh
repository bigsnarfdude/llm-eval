MODEL_ID="vincentoh/llama3-alpaca-dpo-instruct"
TRUST_REMOTE_CODE="yes"
DTYPE="bfloat16"
BATCH_SIZE="auto"
CUDA_DEVICES=0

sudo apt update
sudo apt install -y screen vim git-lfs

pip install -q requests accelerate sentencepiece pytablewriter einops protobuf huggingface_hub==0.21.4
pip install -U transformers
pip install -U torch


huggingface-cli login 

git clone -b add-agieval https://github.com/dmahan93/lm-evaluation-harness
cd lm-evaluation-harness
pip install -e .


benchmark="agieval"
python main.py  --model hf-causal  --model_args pretrained=$MODEL_ID,trust_remote_code=$TRUST_REMOTE_CODE,dtype=$DTYPE \
        --tasks agieval_aqua_rat,agieval_logiqa_en,agieval_lsat_ar,agieval_lsat_lr,agieval_lsat_rc,agieval_sat_en,agieval_sat_en_without_passage,agieval_sat_math \
         --device cuda:$CUDA_DEVICES \
        --batch_size $BATCH_SIZE \
        --output_path ./${benchmark}.json


benchmark="gpt4all"
echo "================== $(echo $benchmark | tr '[:lower:]' '[:upper:]') [2/4] =================="
python main.py \
        --model hf-causal \
        --model_args pretrained=$MODEL_ID,trust_remote_code=$TRUST_REMOTE_CODE,dtype=$DTYPE \
        --tasks hellaswag,openbookqa,winogrande,arc_easy,arc_challenge,boolq,piqa \
        --device cuda:$CUDA_DEVICES \
        --batch_size $BATCH_SIZE \
        --output_path ./${benchmark}.json


benchmark="truthfulqa"
echo "================== $(echo $benchmark | tr '[:lower:]' '[:upper:]') [3/4] =================="
python main.py \
        --model hf-causal \
        --model_args pretrained=$MODEL_ID,trust_remote_code=$TRUST_REMOTE_CODE,dtype=$DTYPE \
        --tasks truthfulqa_mc \
        --device cuda:$CUDA_DEVICES \
        --batch_size $BATCH_SIZE \
        --output_path ./${benchmark}.json


benchmark="bigbench"
echo "================== $(echo $benchmark | tr '[:lower:]' '[:upper:]') [4/4] =================="
python main.py \
        --model hf-causal \
        --model_args pretrained=$MODEL_ID,trust_remote_code=$TRUST_REMOTE_CODE,dtype=$DTYPE \
        --tasks bigbench_causal_judgement,bigbench_date_understanding,bigbench_disambiguation_qa,bigbench_geometric_shapes,bigbench_logical_deduction_five_objects,bigbench_logical_deduction_seven_objects,bigbench_logical_deduction_three_objects,bigbench_movie_recommendation,bigbench_navigate,bigbench_reasoning_about_colored_objects,bigbench_ruin_names,bigbench_salient_translation_error_detection,bigbench_snarks,bigbench_sports_understanding,bigbench_temporal_sequences,bigbench_tracking_shuffled_objects_five_objects,bigbench_tracking_shuffled_objects_seven_objects,bigbench_tracking_shuffled_objects_three_objects \
        --device cuda:$CUDA_DEVICES \
        --batch_size $BATCH_SIZE \
        --output_path ./${benchmark}.json


scp user@123.456.789.123:/home/user/lm-evaluation-harness/agieval.json .
scp user@123.456.789.123:/home/user/lm-evaluation-harness/gpt4all.json .
scp user@123.456.789.123:/home/user/lm-evaluation-harness/pile_statistics.json .
scp user@123.456.789.123:/home/user/lm-evaluation-harness/truthfulqa.json .
scp user@123.456.789.123:/home/user/lm-evaluation-harness/bigbench.json .