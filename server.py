import os
import sys
import logging
from flask import Flask, request, send_from_directory

# set the project root directory as the static folder, you can set others.
app = Flask(__name__, static_url_path='')

@app.route('/hi')
def hi():
    app.logger.error('XXX %r' % request.method)
    return 'Hi2'

@app.route('/<path>', methods=['GET', 'DELETE'])
def path_handler(path):
    app.logger.error('YYY %r %s' % (request.method, path))
    if request.method == 'GET':
        print('SENDING', path)
        return send_from_directory('', path)
    elif request.method == 'DELETE':
        os.unlink(path)
        return 'OK'

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=int(sys.argv[1]))
