
# A very simple Flask Hello World app for you to get started with...

from flask import Flask
from main import run

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello from Flask1!'

@app.route('/code2fab')
def code2fab():
    testing = """
    $fn=32;
    cube();
    sphere();
    """
    #return testing
    return run(testing, 'gpt4')
