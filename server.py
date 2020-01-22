import os
import sys
import logging
from flask import Flask, request, send_from_directory

# set the project root directory as the static folder, you can set others.
app = Flask(__name__)

@app.route('/<path:filename>', methods=['GET', 'DELETE'])
def path_handler(filename):
    if request.method == 'GET':
        return send_from_directory('/downloads', filename)
    elif request.method == 'DELETE':
        os.unlink(path)
        return 'OK'

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=int(sys.argv[1]))
