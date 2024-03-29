
# A very simple Flask Hello World app for you to get started with...

from flask import Flask, Response, request, jsonify
from main import run
from waitress import serve

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello from Flask1!'

@app.route('/code2fab', methods=['POST'])
def code2fab():
    req = request.json
    #return jsonify(req['code'])
    return jsonify(run(req, 'gpt4'))

@app.route('/code2fabtest', methods=['GET'])
def code2fabtest():
    testing = """
    $fn=32;
    cube();
    sphere();
    """
    #return testing
    return run(testing, 'gpt4')

serve(app, host='0.0.0.0', port=8880, threads=1)
