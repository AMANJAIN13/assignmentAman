#import requests
import json
import sys
from jsonpath_ng import jsonpath, parse

# Open JSON File provided on Argument.
json_file = open(sys.argv[1])

# Load JSON contents into a variable.
json_data = json.load(json_file)

# Close JSON File object.
json_file.close()

# Search inside JSON.
jsonpath_expression = parse(sys.argv[2])

for match in jsonpath_expression.find(json_data):
    print(f'Found value for specified key: {match.value}')

# url = "http://169.254.169.254/metadata/instance?api-version=2021-02-01"

#response = requests.request("GET", url)

#print(response.text)
