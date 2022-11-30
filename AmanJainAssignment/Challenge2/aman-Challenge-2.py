import requests
import json
import sys

# Create Instance Metadata URL.
url = "http://169.254.169.254/metadata/instance?api-version=2021-02-01"

# Get response of Instance Metadata.
response = requests.request("GET", url)

# Show response on screen.
print(response.text)

# Open text file for writing.
text_file = open(sys.argv[1], "w")
 
# Write JSON Response to file.
text_file.write(response.text)
 
# Close file.
text_file.close()
