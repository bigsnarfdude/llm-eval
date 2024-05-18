# llm-eval

```

git clone https://github.com/bigsnarfdude/llm-eval.git
bash eval.sh
python main.py

|                                          Model                                          |AGIEval|GPT4All|TruthfulQA|Bigbench|Average|
|-----------------------------------------------------------------------------------------|------:|------:|---------:|-------:|------:|
|[llama3-alpaca-dpo-instruct](https://huggingface.co/vincentoh/llama3-alpaca-dpo-instruct)|  30.67|  70.01|     46.56|    37.3|  46.14|

### AGIEval
|             Task             |Version| Metric |Value|   |Stderr|
|------------------------------|------:|--------|----:|---|-----:|
|agieval_aqua_rat              |      0|acc     |19.69|±  |  2.50|
|                              |       |acc_norm|22.83|±  |  2.64|
|agieval_logiqa_en             |      0|acc     |29.34|±  |  1.79|
|                              |       |acc_norm|32.72|±  |  1.84|
|agieval_lsat_ar               |      0|acc     |20.87|±  |  2.69|
|                              |       |acc_norm|20.43|±  |  2.66|
|agieval_lsat_lr               |      0|acc     |34.31|±  |  2.10|
|                              |       |acc_norm|31.57|±  |  2.06|
|agieval_lsat_rc               |      0|acc     |43.87|±  |  3.03|
|                              |       |acc_norm|35.32|±  |  2.92|
|agieval_sat_en                |      0|acc     |51.46|±  |  3.49|
|                              |       |acc_norm|39.81|±  |  3.42|
|agieval_sat_en_without_passage|      0|acc     |37.38|±  |  3.38|
|                              |       |acc_norm|28.16|±  |  3.14|
|agieval_sat_math              |      0|acc     |37.73|±  |  3.28|
|                              |       |acc_norm|34.55|±  |  3.21|

Average: 30.67%

### GPT4All
|    Task     |Version| Metric |Value|   |Stderr|
|-------------|------:|--------|----:|---|-----:|
|arc_challenge|      0|acc     |50.60|±  |  1.46|
|             |       |acc_norm|53.41|±  |  1.46|
|arc_easy     |      0|acc     |79.84|±  |  0.82|
|             |       |acc_norm|78.28|±  |  0.85|
|boolq        |      1|acc     |80.18|±  |  0.70|
|hellaswag    |      0|acc     |59.39|±  |  0.49|
|             |       |acc_norm|78.33|±  |  0.41|
|openbookqa   |      0|acc     |34.40|±  |  2.13|
|             |       |acc_norm|45.20|±  |  2.23|
|piqa         |      0|acc     |79.54|±  |  0.94|
|             |       |acc_norm|80.85|±  |  0.92|
|winogrande   |      0|acc     |73.80|±  |  1.24|

Average: 70.01%

### TruthfulQA
|    Task     |Version|Metric|Value|   |Stderr|
|-------------|------:|------|----:|---|-----:|
|truthfulqa_mc|      1|mc1   |30.23|±  |  1.61|
|             |       |mc2   |46.56|±  |  1.40|

Average: 46.56%

### Bigbench
|                      Task                      |Version|       Metric        |Value|   |Stderr|
|------------------------------------------------|------:|---------------------|----:|---|-----:|
|bigbench_causal_judgement                       |      0|multiple_choice_grade|54.74|±  |  3.62|
|bigbench_date_understanding                     |      0|multiple_choice_grade|67.75|±  |  2.44|
|bigbench_disambiguation_qa                      |      0|multiple_choice_grade|29.07|±  |  2.83|
|bigbench_geometric_shapes                       |      0|multiple_choice_grade|27.86|±  |  2.37|
|                                                |       |exact_str_match      | 0.00|±  |  0.00|
|bigbench_logical_deduction_five_objects         |      0|multiple_choice_grade|24.80|±  |  1.93|
|bigbench_logical_deduction_seven_objects        |      0|multiple_choice_grade|17.00|±  |  1.42|
|bigbench_logical_deduction_three_objects        |      0|multiple_choice_grade|42.33|±  |  2.86|
|bigbench_movie_recommendation                   |      0|multiple_choice_grade|30.80|±  |  2.07|
|bigbench_navigate                               |      0|multiple_choice_grade|55.60|±  |  1.57|
|bigbench_reasoning_about_colored_objects        |      0|multiple_choice_grade|54.65|±  |  1.11|
|bigbench_ruin_names                             |      0|multiple_choice_grade|32.37|±  |  2.21|
|bigbench_salient_translation_error_detection    |      0|multiple_choice_grade|28.66|±  |  1.43|
|bigbench_snarks                                 |      0|multiple_choice_grade|46.41|±  |  3.72|
|bigbench_sports_understanding                   |      0|multiple_choice_grade|55.48|±  |  1.58|
|bigbench_temporal_sequences                     |      0|multiple_choice_grade|25.30|±  |  1.38|
|bigbench_tracking_shuffled_objects_five_objects |      0|multiple_choice_grade|21.36|±  |  1.16|
|bigbench_tracking_shuffled_objects_seven_objects|      0|multiple_choice_grade|14.91|±  |  0.85|
|bigbench_tracking_shuffled_objects_three_objects|      0|multiple_choice_grade|42.33|±  |  2.86|

Average: 37.3%

Average score: 46.14%


```
