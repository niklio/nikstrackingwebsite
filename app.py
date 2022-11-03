#!/usr/bin/env python

import flask

app = flask.Flask(__name__)

app.config['TEMPLATES_AUTO_RELOAD'] = True

@app.route('/')
def index():
    return flask.render_template('index.html')

if __name__ == '__main__':
    app.debug = True
    app.run()

