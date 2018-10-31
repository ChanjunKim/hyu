import json
from collections import OrderedDict
from pprint import pprint

with open('C:/Users/user/Downloads/microsoft.json', encoding="utf-8") as data_file:
    data = json.load(data_file, object_pairs_hook=OrderedDict)

for a in data["aggregations"]["by_company"]["buckets"]:
    print("회사 = " + a["key"])
    for b in a["by_department"]['buckets']:
        print("\t부서 = " + b["key"])
        for c in b["by_username"]["buckets"]:
            print("\t\t사원 = " + c["key"])