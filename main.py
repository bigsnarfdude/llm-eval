import json
import os
import time

from table import make_final_table, make_table
from upload import upload_to_github_gist

MODEL_ID = 'vincentoh/llama3-alpaca-dpo-instruct'
tasks = ["AGIEval", "GPT4All", "TruthfulQA", "Bigbench"]

def make_summary():
    tables = []
    averages = []
    for task in tasks:
        file_path = f"./{task.lower()}.json"
        if os.path.exists(file_path):
            json_data = open(file_path, "r").read()
            data = json.loads(json_data, strict=False)
            table, average = make_table(data, task)
        else:
            table = ""
            average = "Error: File does not exist"
        tables.append(table)
        averages.append(average)
    summary = ""
    for index, task in enumerate(tasks):
        summary += f"### {task}\n{tables[index]}\nAverage: {averages[index]}%\n\n"
    result_dict = {k: v for k, v in zip(tasks, averages)}
    if all(isinstance(e, float) for e in averages):
        final_average = round(sum(averages) / len(averages), 2)
        summary += f"Average score: {final_average}%"
        result_dict.update({"Average": final_average})
    else:
        summary += "Average score: Not available due to errors"
    final_table = make_final_table(result_dict, MODEL_ID)
    summary = final_table + "\n" + summary
    return summary

print(make_summary())